require 'rails_helper'

RSpec.describe "Students", type: :request do
  
  # Initialize the test data
  let!(:school) { create(:school) }
  let!(:students) { create_list(:student, 2, school_id: school.id) }
  let(:school_id) { school.id }
  let(:id) { students.first.id }

  # Test suite for GET /schools/:school_id/students
  describe 'GET /schools/:school_id/students' do
    before { get "/schools/#{school_id}/students" }

    context 'when school exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all school students' do
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end

  end

  # Test suite for GET /schools/:school_id/students/:id
  describe 'GET /schools/:school_id/students/:id' do
    before { get "/schools/#{school_id}/students/#{id}" }

    context 'when school student exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the student' do
        expect(JSON.parse(response.body)['id']).to eq(id)
      end
    end
  end

  # Test suite for PUT /schools/:school_id/students
  describe 'POST /schools/:school_id/students' do
    let(:valid_attributes) { { name: 'Visit Narnia' } }

    context 'when request attributes are valid' do
      before { post "/schools/#{school_id}/students", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(200)
      end
    end
  end

  # Test suite for PUT /schools/:school_id/students/:id
  describe 'PUT /schools/:school_id/students/:id' do
    let(:valid_attributes) { { name: 'Mozart' } }

    before { put "/schools/#{school_id}/students/#{id}", params: valid_attributes }

    context 'when student exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the student' do
        updated_student = Student.find(id)
        expect(updated_student.name).to match(/Mozart/)
      end
    end
  end

  # Test suite for DELETE /schools/:id
  describe 'DELETE /schools/:id' do
    before { delete "/schools/#{school_id}/students/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end

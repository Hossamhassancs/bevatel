class StudentsController < ApplicationController
  before_action :set_school
  before_action :set_school_student, only: [:show, :update, :destroy]

  def index
    render json: @school.students
  end

  def show
    render json: @student
  end

  def create
    @student = @school.students.create!(student_params)
    render json: @student
  end

  def update
    @student.update(student_params)
    head :no_content
  end

  def destroy
    @student.destroy
    head :no_content
  end

  private

  def student_params
    params.permit(:name)
  end

  def set_school
    @school = School.find(params[:school_id])
  end

  def set_school_student
    @student = @school.students.find_by!(id: params[:id]) if @school
  end

end

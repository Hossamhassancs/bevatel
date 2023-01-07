require 'rails_helper'

RSpec.describe School, type: :model do
  it { should have_many(:students).dependent(:destroy) }
  it { should validate_presence_of(:name) }
end

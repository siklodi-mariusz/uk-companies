require 'rails_helper'

RSpec.describe Company, type: :model do
  subject(:company) { build(:company) }

  it 'has a valid factory' do
    expect(company).to be_valid
  end

  describe 'ActiveModel::Validations' do
    it { is_expected.to validate_presence_of(:company_number) }
    it { is_expected.to validate_uniqueness_of(:company_number).case_insensitive }
  end
end

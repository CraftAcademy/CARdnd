require 'rails_helper'

RSpec.describe Rental, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :automobile_id }
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:automobile) }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:automobile)).to be_valid
    end
  end
end

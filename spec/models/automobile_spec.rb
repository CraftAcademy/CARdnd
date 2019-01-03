require 'rails_helper'

RSpec.describe Automobile, type: :model do
  describe 'DB table' do
    it { is_expected.to have_db_column :brand }
    it { is_expected.to have_db_column :model }
    it { is_expected.to have_db_column :year }
    it { is_expected.to have_db_column :price }
    it { is_expected.to have_db_column :user_id }
    it { is_expected.to have_db_column :description }
    it { is_expected.to have_db_column :engine }
    it { is_expected.to have_db_column :rental_status }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of :brand }
    it { is_expected.to validate_presence_of :model } 
    it { is_expected.to validate_presence_of :year } 
    it { is_expected.to validate_presence_of :price } 
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should have_many(:rental) }
  end

  describe 'Attachments' do
    it 'is valid' do
      subject.image.attach(io: File.open(fixture_path + '/dummy_image.jpg'), filename: 'attachment.jpg', content_type: 'image/jpg')
      expect(subject.image).to be_attached
    end
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:automobile)).to be_valid
    end
  end
end
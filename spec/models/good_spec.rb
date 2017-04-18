require 'rails_helper'

RSpec.describe Good, type: :model do
	describe 'Columns' do
		[:name, :value, :individual_id, :category].each { |column| it { is_expected.to respond_to column } }
	end

	describe 'Associations' do
		it { is_expected.to belong_to :individual }
	end

	describe 'FactoryGirl' do 
		it 'should be a Good' do
			good = FactoryGirl.build :good
			expect(good).to be_a Good
		end
	end

	describe 'Validations' do
		[:individual_id, :name, :value, :category].each { |attribute| it { is_expected.to validate_presence_of attribute } }
		
		it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
	end
end

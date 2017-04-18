require 'rails_helper'

RSpec.describe Individual, type: :model do
  describe 'Columns' do
  	[:email, :name, :address, :password,
  		:city, :gender, :age, :auditor].each { |column| it { is_expected.to respond_to column } }
  end

  describe 'Associations' do
  	it { is_expected.to have_many(:goods) }
  end

  describe 'FactoryGirl' do
  	it 'should be a Individual' do
	  	individual = FactoryGirl.create :individual
	  	expect(individual).to be_a Individual
  	end
  end

  describe 'Validations' do
  	[:email, :name, :address, :password,
  		:city, :gender, :age].each { |attribute| it { is_expected.to validate_presence_of attribute } }

  	it { is_expected.to validate_numericality_of(:age).is_greater_than(0) }
  end

  describe 'Enums' do
  	it { is_expected.to define_enum_for(:gender).with([:male, :female]) }
  end

  describe 'Methods' do
  	describe '#sum_values_of_goods' do
	  	it 'should return the sum of the values of the individual goods' do
	  		individual = FactoryGirl.create :individual
	  		first_good = FactoryGirl.create :good, individual_id: individual.id
	  		second_good = FactoryGirl.create :good, individual_id: individual.id
	  		expect(individual.sum_values_of_goods.to_f).to eq (first_good.value.to_f + second_good.value.to_f).round(2)
	  	end
  	end

    describe '.by_city' do
      it 'should return array of individuals by city' do
        individual = FactoryGirl.create :individual, city: "Fortaleza"
        individual2 = FactoryGirl.create :individual, city: "Fortaleza"
        individual3 = FactoryGirl.create :individual, city: "Mossoro"
        expect(Individual.by_city("Fortaleza")).to include individual, individual2
        expect(Individual.by_city("Fortaleza")).not_to include individual3
      end
    end

    describe '.by_goods_value' do
      it 'should return array of individuals with values of goods greater than 100.000,00' do
        individual = FactoryGirl.create :individual
        individual2 = FactoryGirl.create :individual
        good = FactoryGirl.create :good, individual_id: individual.id, value: 150000
        good2 = FactoryGirl.create :good, individual_id: individual2.id, value: 50000

        expect(Individual.by_goods_value).to include individual
        expect(Individual.by_goods_value).not_to include individual2
      end
    end
  end
end

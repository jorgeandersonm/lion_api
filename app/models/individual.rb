class Individual < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :goods

  validates_presence_of :name, :address, :city, :gender, :age

  validates_numericality_of :age, greater_than: 0

  enum gender: {
  	male: 0,
  	female: 1
  }

  def sum_values_of_goods
  	goods.sum(:value).to_f
  end

  class << self 
    def by_city(city_name)
      Individual.where(city: city_name)
    end

    def by_goods_value
      individuals_by_value = Array.new
      Individual.all.each do |individual|
        individuals_by_value << individual if individual.sum_values_of_goods >= 100000
      end
      individuals_by_value
    end
  end
end

class IndividualsController < ApplicationController
#before_action :authenticate_individual!
	
	def show
  	individual = Individual.find_by_id(params[:id])

  	render :json => individual
  end

  def by_city
  	individuals = Individual.where(:city => params[:city_name])

  	render :json => individuals
  end

  def by_goods_value
  	individuals = Individual.all
  	individuals_by_value = Array.new
  	individuals.each do |individual|
  		individuals_by_value << individual if individual.sum_values_of_goods >= 100 
  	end

  	render :json => individuals_by_value
  end
end

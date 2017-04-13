class IndividualsController < ApplicationController
before_action :authenticate_individual!
	def show
  	individual = Individual.find_by_id(params[:id])

  	render :json => individual
  end

  def by_city
  	individuals = Individual.where(:city => params[:city_name])

  	render :json => individuals
  end
end

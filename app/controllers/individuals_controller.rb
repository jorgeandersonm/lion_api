class IndividualsController < ApplicationController
  before_action :authenticate_individual!

	def index
    render :json => Individual.all
  end

	def show
  	individual = Individual.find(params[:id])

  	render :json => individual
  end

  def by_city
    render :json => Individual.by_city(params[:city_name])
  end

  def by_goods_value
  	render :json => Individual.by_goods_value
  end
end

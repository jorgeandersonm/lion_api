class IndividualController < ApplicationController


	def show
  	individual = Individual.find_by_id(params[:id])

  	render :json => individual
  end
end

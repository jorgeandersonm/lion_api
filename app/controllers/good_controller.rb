class GoodController < ApplicationController

	def list
  	goods = Good.where(:individual_id => params[:id])
  	render :json => goods
  end
end
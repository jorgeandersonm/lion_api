class GoodsController < ApplicationController
before_action :authenticate_individual!
	def create
    good = Good.new(good_params)
    good.individual_id = current_individual.id if current_individual
    if good.save
    	render_create_success
    else
    	render_failed
    end
  end
		
	def destroy
		good = Good.find(params[:id])
		if good.delete
			render_destroy_success
		else
			render_failed
		end
	end

	def update
    good = Good.find(params[:id])
    if good.update(good_params)
    	render_updated_success
    else
    	render_failed
    end
  end

  def show
  	good = Good.find(params[:id])
  	render :json => good
  end

	def list
  	goods = Good.where(:individual_id => params[:id])
  	render :json => goods
  end

  def render_create_success
    render json: {
      status: 'success',
      data:   'Created'
    }
  end

  def render_updated_success
    render json: {
      status: 'success',
      data:   'Updated'
    }
  end

  def render_destroy_success
  	render json: {
      status: 'success',
      data:   'Destroyed'
    }
  end

  def render_failed
    render json: {
      status: 'error',
      data:   'Failed'
    }
  end

  private
  def good_params
    params.permit(:name, :value, :category)
  end
end

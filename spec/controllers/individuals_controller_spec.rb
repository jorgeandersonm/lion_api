require 'rails_helper'

RSpec.describe IndividualsController, type: :controller do

	describe 'Filters' do
		it { is_expected.to use_before_filter :authenticate_individual! }
	end

	let!(:individual) { FactoryGirl.create :individual }

	describe 'Actions' do
		describe 'get #show' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					request.headers.merge!(individual.create_new_auth_token)
					get :show, params: { id: individual.id }
					is_expected.to respond_with :ok
				end
			end

			context 'when individual is not logged in' do
				it 'should respond with http status 401' do
					get :show, params: {id: individual.id}
					is_expected.to respond_with 401
				end
			end

			it 'should response content type equals a json' do
				get :show, params: {id: individual.id}
				expect(response.content_type).to eq('application/json')
			end
		end
		describe 'get #by_city' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					request.headers.merge!(individual.create_new_auth_token)
					get :by_city, params: { city_name: "Fortaleza" }
					is_expected.to respond_with :ok
				end
			end

			context 'when individual is not logged in' do
				it 'should respond with http status 401' do
					get :by_city, params: { city_name: "Fortaleza" }
					is_expected.to respond_with 401
				end
			end

			it 'should response content type equals a json' do
				get :by_city, params: { city_name: "Fortaleza" }
				expect(response.content_type).to eq('application/json')
			end
		end

		describe 'get #by_goods_value' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					request.headers.merge!(individual.create_new_auth_token)
					get :by_goods_value
					is_expected.to respond_with :ok
				end
			end

			context 'when individual is not logged in' do
				it 'should respond with http status 401' do
					get :by_goods_value
					is_expected.to respond_with 401
				end
			end

			it 'should response content type equals a json' do
				get :by_goods_value
				expect(response.content_type).to eq('application/json')
			end
		end
	end
end

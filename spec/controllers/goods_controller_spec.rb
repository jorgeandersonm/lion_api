require 'rails_helper'

RSpec.describe GoodsController, type: :controller do
	describe 'Filters' do
		it { is_expected.to use_before_filter :authenticate_individual! }
	end

	let!(:individual) { FactoryGirl.create :individual }
	let(:good_params) { FactoryGirl.attributes_for :good, individual_id: individual.id }

	describe 'Actions' do
		describe 'post #create' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					request.headers.merge!(individual.create_new_auth_token)
					post :create, params: { name: good_params[:name], value: good_params[:value], category: good_params[:category] }
					is_expected.to respond_with :ok
				end

				it 'should increases Good.count' do
					expect { 
						request.headers.merge!(individual.create_new_auth_token)
						post :create, params: { name: good_params[:name], value: good_params[:value], category: good_params[:category]}
					}.to change(Good, :count).by(1)
				end
			end
		end

		describe 'delete #destroy' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id 
					request.headers.merge!(individual.create_new_auth_token)
					delete :destroy, params: { id: good.id }
					is_expected.to respond_with :ok
				end

				it 'should decreases Good.count' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id 
					expect { 
						request.headers.merge!(individual.create_new_auth_token)
						delete :destroy, params: { id: good.id }
					}.to change(Good, :count).by(-1)
				end
			end
		end

		describe 'put #update' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					put :update, params: { id: good.id, name: 'New Name' }
					is_expected.to respond_with :ok
				end

				it 'should good updated' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					put :update, params: { id: good.id, name: 'New Name' }
					good.reload
					expect(good.name).to eq 'New Name'
				end
			end
		end

		describe 'get #show' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					get :show, params: { id: good.id }
					is_expected.to respond_with :ok
				end

				it 'should return json' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					get :show, params: { id: good.id }
					expect(response.content_type).to eq('application/json')
				end
			end
		end

		describe 'get #list' do
			context 'when individual is logged in' do
				it 'should respond with http status :ok' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					get :list
					is_expected.to respond_with :ok
				end

				it 'should return json' do
					individual = FactoryGirl.create :individual
					good = FactoryGirl.create :good, individual_id: individual.id
					request.headers.merge!(individual.create_new_auth_token)
					get :list
					expect(response.content_type).to eq('application/json')
				end
			end
		end
	end
end

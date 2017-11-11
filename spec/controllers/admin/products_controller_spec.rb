# require 'rails_helper'
#
# RSpec.describe Admin::ProductsController, type: :controller do
#
#   let(:admin) { create(:admin) }
#   before { sign_in admin }
#
#   describe 'GET #index' do
#     let!(:product) { create_list(:product, 3) }
#     before { get :index }
#     it { expect(assigns(:products).count).to eq(3) }
#   end
#
#   describe 'GET #new' do
#     before { get :new }
#     it { expect(assigns(:product)).to be_a_new(Product) }
#   end
#
#   describe 'POST #create' do
#
#     before { post :create, params: product_params }
#
#     context 'when save is successful' do
#       let(:brand) { create(:brand) }
#       let(:category) { create(:category) }
#       let(:product_params) do
#         { product: attributes_for(:product, brand_id: brand.id, category_id: category.id) }
#       end
#       it { expect(Product.all.count).to eq(1) }
#       it { is_expected.to redirect_to(admin_product_path(Product.first.id)) }
#     end
#
#     context 'when save is unsuccessful' do
#       let(:product_params) do
#         { product: attributes_for(:product, :invalid) }
#       end
#       it { is_expected.to render_template(:new) }
#     end
#
#   end
#
#   describe 'GET #edit' do
#     let(:product) { create(:product) }
#     before { get :edit, params: { id: product.id } }
#     it { expect(assigns(:product)).to eq(product) }
#   end
#
#   describe 'PUT/PATCH #update' do
#
#     let!(:product) { create(:product) }
#     before { put :update, params: params }
#
#     context 'when update is successful' do
#       let(:params) do
#         {
#           id: product.id,
#           product: attributes_for(:product, cost_price: 50)
#         }
#       end
#       it { is_expected.to redirect_to(admin_product_path(Product.first)) }
#     end
#
#     context 'when update is unsuccessful' do
#       let(:params) do
#         {
#           id: product.id,
#           product: attributes_for(:product, :invalid)
#         }
#       end
#       it { is_expected.to render_template(:edit) }
#     end
#
#   end
#
#   describe 'DELETE #destroy' do
#     let!(:product) { create(:product) }
#     before { delete :destroy, params: { id: product.id } }
#     it { expect(assigns(:product)).to be_destroyed }
#     it { is_expected.to redirect_to(admin_products_path) }
#   end
#
# end

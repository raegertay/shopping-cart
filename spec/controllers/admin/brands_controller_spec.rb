require 'rails_helper'

RSpec.describe Admin::BrandsController, type: :controller do

  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    let!(:brand) { create_list(:brand, 3) }
    before { get :index }
    it { expect(assigns(:brands).count).to eq(3) }
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(assigns(:brand)).to be_a_new(Brand) }
  end

  describe 'POST #create' do

    before { post :create, params: brand_params }

    context 'when save is successful' do
      let(:brand_params) do
        { brand: attributes_for(:brand) }
      end
      it { is_expected.to redirect_to(admin_brands_path) }
    end

    context 'when save is unsuccessful' do
      let(:brand_params) do
        { brand: attributes_for(:brand, name: nil) }
      end
      it { is_expected.to render_template(:index) }
    end

  end

  describe 'GET #edit' do
    let(:brand) { create(:brand) }
    before { get :edit, params: { id: brand.id } }
    it { expect(assigns(:brand)).to eq(brand) }
  end

  describe 'PUT/PATCH #update' do

    let!(:brand) { create(:brand) }
    before { put :update, params: params }

    context 'when update is successful' do
      let(:params) do
        {
          id: brand.id,
          brand: attributes_for(:brand, name: 'whatever')
        }
      end
      it { is_expected.to redirect_to(admin_brands_path) }
    end

    context 'when update is unsuccessful' do
      let(:params) do
        {
          id: brand.id,
          brand: attributes_for(:brand, name: nil)
        }
      end
      it { is_expected.to render_template(:edit) }
    end

  end

  describe 'DELETE #destroy' do
    let!(:brand) { create(:brand) }
    before { delete :destroy, params: { id: brand.id } }
    it { expect(assigns(:brand)).to be_destroyed }
    it { is_expected.to redirect_to(admin_brands_path) }
  end

end

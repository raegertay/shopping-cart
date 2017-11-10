require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  let(:admin) { create(:admin) }
  before { sign_in admin }

  describe 'GET #index' do
    let!(:category) { create_list(:category, 3) }
    before { get :index }
    it { expect(assigns(:categories).count).to eq(3) }
  end

  describe 'GET #new' do
    before { get :new }
    it { expect(assigns(:category)).to be_a_new(Category) }
  end

  describe 'POST #create' do
    before { post :create, params: category_params }

    context 'when save is successful' do
      let(:category_params) do
        { category: attributes_for(:category) }
      end
      it { is_expected.to redirect_to(admin_categories_path) }
    end

    context 'when save is unsuccessful' do
      let(:category_params) do
        { category: attributes_for(:category, name: nil) }
      end
      it { is_expected.to render_template(:index) }
    end

    describe 'GET #edit' do
      let(:category) { create(:category) }
      before { get :edit, params: ( id: category.id) }
      it { expect(assigns(:category)).to eq(category) }
    end

    describe 'PUT/PATCH #update' do
      let!(:category) { create(:category) }
      before { put :update, params: params }

      context 'when update is successful' do
        let(:params) do
          {
            id: category.id,
            brand: attributes_for(:category, name: "New Category name.")
          }
        end
        it { is_expected.to redirect_to(admin_categories_path) }
      end

      context 'when update is unsuccessful' do
          let(:params) do
            {
              id: category.id,
              category: attributes_for(:category, name: nil)
            }
          end
          it { is_expected.to render_template(:edit) }
      end

    end

    describe 'DELETE #destroy' do
      let!(:brand) { create(:category) }
      before { delete :destroy, params: { id: category.id} }
      it { expect(assigns(:brand)).to be_destroyed }
      it { is_expected.to redirect_to(admin_categories_path) }
    end

  end

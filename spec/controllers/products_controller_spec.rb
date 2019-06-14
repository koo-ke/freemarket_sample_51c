require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #index' do

    

    it 'リクエストは成功してレスポンスとともに要求に応じた情報が返される'  do
      expect(response.status).to eq 200
    end

  end

  describe 'GET #show' do

      it 'リクエストは成功してレスポンスとともに要求に応じた情報が返される' do
        expect(response.status).to eq 200
      end

  end

  describe 'GET #new' do

    before do
      get :new
    end

    it "newアクションが動いたあとnew.html.hamlに遷移する" do
      get :new
      expect(response).to render_template :new
    end
    it 'リクエストは成功してレスポンスとともに要求に応じた情報が返される' do
      expect(response.status).to eq 200
    end
    it '@productに新しい商品を割り当てることが出来る' do
      expect(assigns(:product)).to be_a_new(Product)
    end
    
  end

end
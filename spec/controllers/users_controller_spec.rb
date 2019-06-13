require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'Get #index' do
    before do
      get 'index'
    end
    it 'indexアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #signup' do
    before do
      get 'signup'
    end
    it 'signupアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #login' do
    before do
      get 'login'
    end
    it 'loginアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #paying' do
    before do
      get 'paying'
    end
    it 'payingアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #information' do
    before do
      get 'information'
    end
    it 'informationアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

  describe 'Get #logout' do
    before do
      get 'logout'
    end
    it 'logoutアクションは200Successが成功します'  do
      expect(response.status).to eq 200
    end
  end

end

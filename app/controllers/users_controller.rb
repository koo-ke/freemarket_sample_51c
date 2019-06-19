class UsersController < ApplicationController
  
  def index
    @user = current_user
  end
  
  def show
    @user = current_user
  end

  def signup
  end

  def paying
  end

  def information
    @user = current_user
  end

  def login
  end

  def logout
  end

end

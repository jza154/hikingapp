class UsersController < ApplicationController
  
  def index
    @user = User.all
     if params[:search]
    @user = User.search(params[:search]).order("created_at DESC")
  else
    @user = User.all.order('created_at DESC')
  end
  end

  def show
    @user=User.find(params[:id])
  end


  
end

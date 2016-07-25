class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
   
     if params[:search]
        @user = User.search(params[:search]).order("created_at DESC")
     else
        @users = User.all.order('created_at DESC')
      end
  end
  

  def show
    @user =User.find(params[:id])
    @dogs = Dog.where(user_id: @user.id).order("created_at DESC")
    
    @reviews = Review.where(receiver_id: @user.id).order("created_at DESC")
    
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end


  
end

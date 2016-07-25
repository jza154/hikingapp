class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.paginate(page: params[:page], per_page: 10)
   
    # if params[:search]
    #   @user = User.search(params[:search]).order("created_at DESC")
    # else
    #   @users = User.all.order('created_at DESC')
    # end

  end
  

  def show
    @user =User.find(params[:id])
    @dogs = Dog.where(user_id: @user.id).order("created_at DESC")
    
    @reviews = Review.where(receiver_id: @user.id).order("created_at DESC").paginate(:page => params[:page], per_page: 2)
    @user_review = Review.where(receiver_id: @user.id)
    
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating)#.round(2)
    end
  end
  
  # private
    # def user_params
    #   params.require(:user).permit(:first_name, :last_name, :address, :about, :birthday, :dog_breed ,:dog_height, :dog_weight, :dog_weight, :image)
    # end
    def configure_permitted_parameters
        devise_parameter_sanitizer.for(:user_update) { |u| u.permit(:first_name, :last_name, :address, :about, :birthday, :dog_breed ,:dog_height, :dog_weight, :dog_weight, :image) }
    end


  
end


  # create_table "users", force: :cascade do |t|
  #   t.string   "email",                  default: "", null: false
  #   t.string   "encrypted_password",     default: "", null: false
  #   t.string   "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.integer  "sign_in_count",          default: 0,  null: false
  #   t.datetime "current_sign_in_at"
  #   t.datetime "last_sign_in_at"
  #   t.string   "current_sign_in_ip"
  #   t.string   "last_sign_in_ip"
  #   t.datetime "created_at",                          null: false
  #   t.datetime "updated_at",                          null: false
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.date     "birthday"
  #   t.string   "dog_breed"
  #   t.integer  "dog_height"
  #   t.integer  "dog_weight"
  #   t.integer  "dog_age"
  #   t.text     "address"
  #   t.text     "about"
  #   t.string   "Image"
  # end
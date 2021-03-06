# == Schema Information
#
# Table name: dogs
#
#  id                     :integer          not null, primary key
#  name                   :string
#  breed                  :string
#  age                    :integer
#  gender                 :string
#  weight                 :float
#  about                  :text
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  user_id                :integer
#  dog_image_file_name    :string
#  dog_image_content_type :string
#  dog_image_file_size    :integer
#  dog_image_updated_at   :datetime
#

require 'test_helper'

class DogsControllerTest < ActionController::TestCase
  setup do
    @dog = dogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dog" do
    assert_difference('Dog.count') do
      post :create, dog: { about: @dog.about, age: @dog.age, breed: @dog.breed, gender: @dog.gender, name: @dog.name, weight: @dog.weight }
    end

    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should show dog" do
    get :show, id: @dog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dog
    assert_response :success
  end

  test "should update dog" do
    patch :update, id: @dog, dog: { about: @dog.about, age: @dog.age, breed: @dog.breed, gender: @dog.gender, name: @dog.name, weight: @dog.weight }
    assert_redirected_to dog_path(assigns(:dog))
  end

  test "should destroy dog" do
    assert_difference('Dog.count', -1) do
      delete :destroy, id: @dog
    end

    assert_redirected_to dogs_path
  end
end

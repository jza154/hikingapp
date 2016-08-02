ActiveAdmin.register User do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :birthday
    column :owner
    column :walker
    column :address
    column :about
    column :created_at
    column :updated_at
    actions
  end

  permit_params :first_name, :last_name, :email, :birthday, :owner, :walker, :address, :about, :created_at, :updated_at


end

ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

index do
    selectable_column
    column :id
    column :user_id
    column :title
    column :content
    column :created_at
    column :updated_at
    actions
end
  
permit_params :user_id, :title, :content


end

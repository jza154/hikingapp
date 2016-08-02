ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
index do
    selectable_column
    column :id
    column :user_id
    column :event_name
    column :date
    column :time
    column :location
    column :desription
    column :created_at
    column :updated_at
    actions
end

permit_params :event_name, :desription, :date, :time, :location, :user_id

end

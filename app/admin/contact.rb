ActiveAdmin.register Contact do
    menu label: "Messages"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#

 permit_params :first_name, :last_name, :subject, :email, :message
 

end

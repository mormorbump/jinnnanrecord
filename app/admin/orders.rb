ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

	permit_params :user_id, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :tel_num, :total_price, :deliver, :payment, :status
  menu label: "管理者情報", priority: 7

  index do
    selectable_column
    id_column
    column :user_id
    column :last_name
    column :first_name
    column :last_name_kana 
    column :first_name_kana
    column :postal_code
    column :address
    column :tel_num
    column :total_price
    column :deliver
    column :payment
    column :status
    column :created_at
    actions
  end

    filter :user_id
    filter :last_name
    filter :first_name
    filter :last_name_kana 
    filter :first_name_kana
    filter :postal_code
    filter :address
    filter :tel_num
    filter :total_price
    filter :deliver
    filter :payment
    filter :status
    filter :created_at

  form do |f|
    f.inputs do
	    f.input :user_id
	    f.input :last_name
	    f.input :first_name
	    f.input :last_name_kana 
	    f.input :first_name_kana
	    f.input :postal_code
	    f.input :address
	    f.input :tel_num
	    f.input :total_price
	    f.input :deliver
	    f.input :payment
	    f.input :status	
    end
    f.actions
  end

end


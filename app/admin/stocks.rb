ActiveAdmin.register Stock do
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

	permit_params :item_id,:quantity
	menu parent: "商品個別設定", label: "在庫情報"

	index do
		column :id
		column :item_id
		column :item_id do |item|
			Item.where(id: Item.where(id: item.item_id).all.pluck(:id)).all.pluck(:item_name).join(', ')
		end
		column :quantity
		actions
	end
end

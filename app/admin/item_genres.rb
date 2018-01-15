ActiveAdmin.register ItemGenre do
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

	permit_params :genre_id, :item_id
	menu parent: "商品個別設定", label: "ジャンル情報"

	index do
		column :item_id do |item|
			Item.where(id: Item.where(id: item.item_id).all.pluck(:id)).all.pluck(:item_name).join(', ')
		end
		column :genre_id do |genre|
			Genre.where(id: Genre.where(id: genre.genre_id).all.pluck(:id)).all.pluck(:genre_name).join(', ')
		end
		actions
	end

end

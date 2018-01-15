ActiveAdmin.register Track do
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

	permit_params :item_id, :artist_id, :disc_num, :track_order, :song_title, :song_time
	menu parent: "商品個別設定", label: "曲情報"

	index do
		column :item_id
		column :artist_id
		column :disc_num
		column :track_order
		column :song_title
		column :song_time
		actions
	end
end

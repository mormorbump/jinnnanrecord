ActiveAdmin.register Item do
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
	permit_params :artist_id, :item_name, :label, :release_date, :price,:category_id, item_genres_attributes: [:genre_id, :_destroy], stock_attributes: [:quantity, :_destroy], tracks_attributes: [:artist_id, :disc_num, :track_order, :song_title, :song_time, :_destroy]
	menu label: "商品情報", priority: 2

	controller do
		def scoped_collection
			Item.includes(:item_genres)
		end
	end

	index do
		column :item_name
		column :artist_id do |item|
			Artist.where(id: Artist.where(id: item.id).all.pluck(:id)).all.pluck(:artist_name).join(', ')
		end
		column :label
		column :release_date
		column :price
		actions
	end

	form(:html => { :multipart => true }) do |f|
		f.inputs "アイテム詳細" do
			f.input :item_name
			f.input :artist_id, :as => :select, :collection => Artist.all
			f.input :label
			f.input :release_date , :as => :date_picker
			f.input :price
			f.input :category_id, :as => :select, :collection => Category.all
		end

		# f.has_many :item_genres, allow_destroy: true, heading: false, new_record: true do |ab|
		# 	ab.input :genre_id,
		# 	label: 'ジャンル',
		# 	as: :select,
		# 	collection: Genre.all.map { |a| [a.genre_name, a.id] }
		# end

		f.inputs "在庫", :for => [:stock, f.object.stock || Stock.new] do |s|
	    	s.input :quantity
	    end
		
		f.actions
	end

	show do |i|
		attributes_table  do
			row :artist_id
			row 'アーティスト名' do
				Artist.where(id: Artist.where(id: resource.id).all.pluck(:artist_id)).all.pluck(:artist_name).join(',')
			end
			row :item_name
			row :label
			row :release_date
			row :price
			row :category_id
			# row :image do |obj|
		 #        image_tag(obj.image.expiring_url(10))
		 #    end
		end

		panel 'ジャンル' do
			attributes_table_for i.item_genres do
				row :genre_id
			end
		end

		panel '在庫' do
			attributes_table_for i.stock do
				row :quantity
			end
		end
	end

end

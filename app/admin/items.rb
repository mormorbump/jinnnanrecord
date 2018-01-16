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
	permit_params :artist_id, :item_name, :label, :release_date, :price, :category_id, :image, item_genres_attributes: [:genre_id, :_destroy], stock_attributes: [:quantity, :_destroy], tracks_attributes: [:artist_id, :disc_num, :track_order, :song_title, :song_time, :_destroy]
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
			f.attachment_field :image
			f.input :artist_id, :as => :select, :collection => Artist.all
			f.input :label
			f.input :release_date , :as => :date_picker
			f.input :price
			f.input :category_id, :as => :select, :collection => Category.all
			# f.has_many :item_genres, heading: false,
			# 	allow_destroy: true,
			# 	new_record: true do |datacenter_form|
			# 	datacenter_form.input :genre_id        
			# end
			f.has_many :item_genres do |datacenter_form|
		    	datacenter_form.input :genre_id, :allow_destroy => true
		    	datacenter_form.input :_destroy, :as => :boolean, :required => false, :label => '削除する'
		    end

		    f.inputs "在庫", :for => [:stock, f.object.stock || Stock.new] do |s|
		    	s.input :quantity
		    end
			f.actions
		end

		# ジャンル情報
		# f.inputs do
		# 	f.has_many :item_genres,
		# 	new_record: true,
		# 	allow_destroy: true do |b|
		# 		b.input :genre_id
		# 	end
		# end

		# f.inputs do
		# 	f.has_many :item_genres, sortable: :position, sortable_start: 1 do |t|
		# 		t.input :genre_id
		# 	end
		# end

		# f.has_many :genres do |genre|
		# 	genre.input :track, as: :string, input_html: {
		# 		class: 'autocomplete',
		# 		name: '',
		# 		value: genre.object.track.try(:title),
		# 		data: {
		# 			url: autocomplete_manage_tracks_path
		# 		}
		# 	}
		# 	genre.input :track_id, as: :hidden
		# end
		# f.inputs do
		# 	f.has_many :item_genres do |g|
		# 		g.input :genre_id
		# 	end
		# end

		# f.has_many :item_genres, allow_destroy: true, heading: false, new_record: true do |ab|
		# 	ab.input :genre_id,
		# 	label: 'ジャンル',
		# 	as: :select,
		# 	collection: Genre.all.map { |a| [a.genre_name, a.id] }
		# end

		# f.inputs do
		# 	f.has_many :item_genres, heading: 'ジャンル情報',
		# 	allow_destroy: true,
		# 	new_record: true do |a|
		# 		# a.input :genre_id
		# 		a.input :genre_id, :as => :select, :collection => Genre.all
		# 	end
		# end

		# f.has_many :item_genres do |app_f|
		# 	app_f.inputs "genre_name" do
		# 		if !app_f.object.nil?
		# 		# show the destroy checkbox only if it is an existing appointment
		# 		# else, there's already dynamic JS to add / remove new appointments
		# 			app_f.input :_destroy, :as => :boolean, :label => "Destroy?"
		# 		end

		# 		app_f.input :genre_id # it should automatically generate a drop-down select to choose from your existing patients
		# 		# app_f.input :appointment_date
		# 	end
		# end

		# 曲情報
		# f.inputs do
	 #      f.has_many :tracks, heading: "曲情報", allow_destroy: true, new_record: true do |t|
	 #        t.input :track_name, :as => :file, :hint => t.object.new_record? ? "" : t.template.image_tag(t.object.image.url(:thumb))
	 #      end
	 #    end

		# 在庫情報
		# f.inputs do
		# 	f.inputs "在庫", :for => [:stock, f.object.stock || Stock.new] do |s|
		#     	s.input :quantity
		#     end
		# 	f.actions
		# end
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
			# row :image do |i|
			# 	# image_tag(i.image.url(:thumb), :height => '100')
			#     link_to(image_tag(i.image.url(:thumb), :height => '100'), admin_item_path(i))
			# end
			# row :image do |item|
		 #        image_tag item.image.url
		 #    end
			# row :image do
		 #    	# span link_to(resource.image.path, resource.image)
	  #   		img(src: resource.image.path)
		 #    end
			# row :image do
			# 	# if !(place.place_pictures.empty?)
			# 	# 	ul do
			# 	# 		place.place_pictures.each do |img|
			# 	# 	li do
			# 	# 		image_tag(img.picture.url(:thumb))
			# 	# 	end
			# 	# end
			# 	image_tag(img.picture.url(:thumb))
			# end

			# row :image do	
			# 	image_tag(img.image.url(:thumb))
			# end
			row :image do
				# resource.image_id? ? image_tag(resource.image_id.url, height: '100') : content_tag(:span, "No photo yet")
				# if resource.image_id
				# 	content_tag(:span, "登録済み")
				# else 
				# 	content_tag(:span, "未登録")
				# end

				resource.image_id || '未登録'
				# image_tag attachment_url(i.image, :file, :fill, 200, 200)
				# image_tag attachment_url(i.object, :file, :fill, 200, 200)
				# content_tag(:span, "No photo yet")
			end
			# row :image do |i|
			#        image_tag(i.image.url(:m))
			# end
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
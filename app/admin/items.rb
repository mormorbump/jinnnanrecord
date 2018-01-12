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
	permit_params :artist_id, :item_name, :label, :release_date, :price,:category_id, item_genres_attributes: [:genre_id]

	form do |f|
		f.inputs do
		  f.label :artist_id
	      f.collection_select :artist_id, Artist.all, :id, :artist_name

			f.has_many :item_genres do |t|
				# t.input :genre_id
				# t.collection_select :genre_id
				t.label :artist_id
	      		t.collection_select :genre_id, Genre.all, :id, :genre_name
			end
		end
		f.actions
	end



	# controller do
	# 	def create
	# 		super do |success,failure|
	# 			success.html {
	# 			  # flash[:notice] = "Created."

	# 			  # item_genre = ItemGenre.new
	# 			  # item_genre.item_id = Item.last.id
	# 			  # item_genre.genre_id = ''
	# 			  # item_genre.save

	# 			  redirect_to new_admin_item_genre_path


	# 			}
	# 		end
	# 	end

	# 	def update
	# 		super do |success,failure|        
	# 			success.html {
	# 			  flash[:notice] = "Updated."
	# 			  redirect_to collection_path 
	# 			}
	# 		end
	# 	end
 #    end

end

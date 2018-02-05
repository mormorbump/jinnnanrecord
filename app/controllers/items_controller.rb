class ItemsController < RankingController
  before_action :ranking, only: [:index]

  def index
    @genres = Genre.all
    # ジャンル絞り
    if params[:genre_id].presence
      genre = Genre.find(params[:genre_id])
      @items = genre.items.order(id: :desc).page(params[:page]).per(12)
      @items_count = genre.items.count
    # 検索機能
    elsif params[:search].presence
      @search_form = ItemSearchForm.new(item_search_form_params)
      items = @search_form.search
      items = items.reverse if items.presence
      @items = Kaminari.paginate_array(items).page(params[:page]).per(12)
      @items_count = items.length
      # binding.pry
    else
      @items = Item.order(id: :desc).page(params[:page]).per(12)
      @items_count = Item.all.count
    end

    @cart = Cart.find_by(user_id: current_user)
    @cart_item = @cart.cart_items.build if current_user.presence
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_user.cart.cart_items.build if current_user.presence
    @review = Review.new
    @reviews = @item.reviews.order(id: :desc).page(params[:page]).per(3)
    @stock = @item.stock
    @song_time_sum = @item.tracks.sum_of_songs
  end

  def item_search_form_params
    params.require(:search).permit(:item_name, :artist_name, :song_title, :category_name)
  end
end

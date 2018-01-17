class ItemsController < RankingController

  def index
    @items = Item.order(id: :desc).page(params[:page]).per(10)
    @items_count = Item.all.count
    @genres = Genre.all
    # ジャンル絞り
    if params[:genre_id].presence
      genre = Genre.find(params[:genre_id])
      @items = genre.items.order(id: :desc).page(params[:page]).per(10)
      @items_count = genre.items.count
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
  end
end

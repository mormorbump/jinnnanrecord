class ItemsController < RankingController

  def index
    @items_count = Item.all.count
    @items = Item.order(id: :desc).page(params[:page]).per(10)
    @cart = Cart.find_by(user_id: current_user)
    @cart_item = @cart.cart_items.build if current_user.presence
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_user.cart.cart_items.build if current_user.presence
    @review = Review.new
    @reviews = @item.reviews.order(id: :desc).page(params[:page]).per(3)
  end
end

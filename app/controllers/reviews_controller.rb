class ReviewsController < ApplicationController
  before_action :set_item
  def create
    review = @item.reviews.build(review_params)
    review.save
    redirect_to @item
  end

  def destroy
    review = current_user.reviews.find_by(item: @item.id)
    review.destroy
    redirect_to @item
  end

  private
    def set_item
      @item = Item.find(params[:item_id])
    end

    def review_params
      params.require(:review).permit(:item_id,:nickname,:rate,:review).merge(user_id: current_user.id)
    end
end

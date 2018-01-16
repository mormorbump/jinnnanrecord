class RankingController < ApplicationController
  before_action :ranking

  def ranking
    # groupメソッドでまとめたキーに対しquantityの総和を値としてぶっ込み（sum）sortメソッドでquantityの大きい順に並び替えて、二次元配列となったのをmapで展開し、idだけ取り出しまた配列に戻す。
    item_ids = OrderItem.group(:item_id).sum(:quantity).sort{|(id1,qua1),(id2,qua2)| qua2 <=> qua1 }.map{|item| item[0]}
    # 配列にはlimitメソッドは使えないのでfirstメソッドに引数を指定
    @ranking = item_ids.map{ |id| Item.find(id)}.first(5)
  end
end

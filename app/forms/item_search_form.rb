class ItemSearchForm
  # 様々な検索条件を一つにまとめたクラス
  include ActiveModel::Model

  attr_accessor :item_name, :artist_name, :song_title, :category_name

  # フォームに設定したカラムに対応した返り値を設定
  def search
    # フォームに何も入ってない時はItem.allが返るようにする。relはRelationオブジェクトってこと
    rel = Item
    # like ?は曖昧検索。%#{}%ってやると含んだやつ全てってことになる
    rel = rel.where("item_name like ?", "%#{item_name}%") if item_name.present?
    # =&gtは => と同じ。というか文字化け
    # joinsは内部結合。Itemに関連付いてるものだけを検索
    # *はカラム全ての省略形
    # selectにはテーブル名が入る
    # whereにもテーブル名、というかsql文が入る
    rel = rel.joins(:artist).select("items.*, artists.*").where("artists.artist_name like ?", "%#{artist_name}%") if artist_name.present?

    rel = rel.joins(:tracks).select("items.*, tracks.*").where("tracks.song_title like ?", "%#{song_title}%") if song_title.present?
    rel = rel.joins(:category).select("items.*, categories.*").where("categories.category_name like ?", "%#{category_name}%") if category_name.present?
    rel.all
    binding.pry
  end
end

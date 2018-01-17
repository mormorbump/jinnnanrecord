class ItemSearchForm
  # 様々な検索条件を一つにまとめたクラス
  include ActiveModel::Model

  attr_accessor  :id, :item_name, :artist_name, :artist_name_kana

  def search
    # if params[:seach] == nil?
    rel = Item
    rel = rel.where(id: id) if id.present?
    rel = rel.where(item_name: item_name) if item_name.present?
    # =&gtは => と同じ
    rel = rel.joins(:artist).where("artist.artist_name" =&gt; artist_name) if artist_name.present?
    rel = rel.joins(:artist).where("artist.artist_name_kana" =&gt; artist_name_kana) if artist_name_kana.present?

    rel
  end
end

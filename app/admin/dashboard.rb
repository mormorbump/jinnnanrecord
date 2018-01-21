ActiveAdmin.register_page "Dashboard" do

  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  menu label: "TOP",  priority: 1

  content title: proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      # column do
      #   columns do
      #     ul do
      #       Item.recent(5).map do |item|
      #         li link_to(item.item_name, admin_item_path(item))
      #       end
      #     end
      #   end
      # end

      # Order.select("status, count(*)").group("status")

      # section "Recent Products" do
      #   table_for History.order("item_name desc").limit(5) do
      #     column :item_id
      #   end
      #   strong { link_to "View All Products", admin_items_path }
      # end

      # column do
      #   panel "Info" do
      #     para "新着情報はありません。"
      #   end
      # end

      section do
        con = ActiveRecord::Base.connection
        text_node '<h3>注文状況</h3>'.html_safe
        text_node '<table border=1>'.html_safe
        text_node '<tr>'.html_safe
        text_node '<th>受付済み</th>'.html_safe
        text_node '<th>入金待ち</th>'.html_safe
        text_node '<th>発送待ち</th>'.html_safe
        text_node '</tr>'.html_safe
        text_node '<tr>'.html_safe
        text_node ('<td>' + con.select_value('SELECT COUNT(*) FROM orders WHERE status = 0').to_s + '件</td>').html_safe
        text_node ('<td>' + con.select_value('SELECT COUNT(*) FROM orders WHERE status = 1').to_s + '件</td>').html_safe
        text_node ('<td>' + con.select_value('SELECT COUNT(*) FROM orders WHERE status = 2').to_s + '件</td>').html_safe
        text_node '</tr>'.html_safe
        text_node '</table>'.html_safe

        text_node '<h3>販売状況</h3>'.html_safe
        text_node '<table border=1>'.html_safe
        text_node '<tr>'.html_safe
        text_node '<th>登録済アイテム</th>'.html_safe
        text_node '<th>欠品中アイテム</th>'.html_safe
        text_node '</tr>'.html_safe
        text_node '<tr>'.html_safe
        text_node ('<td>' + con.select_value('SELECT COUNT(*) FROM items').to_s + 'アイテム</td>').html_safe
        text_node ('<td>' + con.select_value('SELECT COUNT(*) FROM items i LEFT JOIN stocks s ON i.id = s.item_id WHERE s.quantity = 0').to_s + 'アイテム</td>').html_safe
        text_node '</tr>'.html_safe
        text_node '</table>'.html_safe
      end
    end
  end # content
end

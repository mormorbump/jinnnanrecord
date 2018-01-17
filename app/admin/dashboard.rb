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
      #   panel "Recent Posts" do
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

      column do
        panel "Info" do
          para "新着情報はありません。"
        end
      end
    end
  end # content
end

class AddUrlToFlowcharts < ActiveRecord::Migration[5.2]
  def change
    add_column :flowcharts, :url, :text
  end
end

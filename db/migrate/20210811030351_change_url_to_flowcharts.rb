class ChangeUrlToFlowcharts < ActiveRecord::Migration[5.2]
  def change
    change_column :flowcharts, :url, :text
  end
end

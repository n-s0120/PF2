class AddPartUrlToFlowcharts < ActiveRecord::Migration[5.2]
  def change
    add_column :flowcharts, :url, :text
    add_column :flowcharts, :part, :string
  end
end

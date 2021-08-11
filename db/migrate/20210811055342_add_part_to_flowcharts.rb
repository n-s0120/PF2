class AddPartToFlowcharts < ActiveRecord::Migration[5.2]
  def change
    add_column :flowcharts, :part, :string
  end
end

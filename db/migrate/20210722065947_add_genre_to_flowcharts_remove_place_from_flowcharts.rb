class AddGenreToFlowchartsRemovePlaceFromFlowcharts < ActiveRecord::Migration[5.2]
  def change
    add_column :flowcharts, :genre, :string

    remove_column :flowcharts, :place, :string
  end
end

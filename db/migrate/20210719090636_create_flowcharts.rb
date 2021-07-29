# frozen_string_literal: true

class CreateFlowcharts < ActiveRecord::Migration[5.2]
  def change
    create_table :flowcharts do |t|
      t.string :title
      t.text :introduction
      t.string :place

      t.timestamps
    end
  end
end

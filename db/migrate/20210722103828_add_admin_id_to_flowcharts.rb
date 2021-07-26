# frozen_string_literal: true

class AddAdminIdToFlowcharts < ActiveRecord::Migration[5.2]
  def change
    add_column :flowcharts, :admin_id, :integer
  end
end

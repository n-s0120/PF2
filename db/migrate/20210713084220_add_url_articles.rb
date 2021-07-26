# frozen_string_literal: true

class AddUrlArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :url, :string
  end
end

class AddArticleIdToReports < ActiveRecord::Migration[5.2]
  def change
    add_column :reports, :article_id, :integer
  end
end

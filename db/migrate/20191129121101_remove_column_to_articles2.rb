class RemoveColumnToArticles2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :comment_id, :bigint
  end
end

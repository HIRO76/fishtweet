class AddReferenceToArticles < ActiveRecord::Migration[5.2]
  def change
    add_reference :articles, :comment, null: false, foreign_key: true
  end
end

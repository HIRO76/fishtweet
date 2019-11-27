class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :body, null: false
      t.string :title, null: false
      t.text :description

      t.timestamps
    end
  end
end

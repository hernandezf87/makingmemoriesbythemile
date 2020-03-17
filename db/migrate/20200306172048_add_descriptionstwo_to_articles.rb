class AddDescriptionstwoToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :descriptionstwo, :string
  end
end

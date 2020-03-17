class AddDescriptionsToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :descriptions, :string
  end
end

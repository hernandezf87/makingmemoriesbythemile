class AddDescriptionsthreeToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :descriptionsthree, :string
  end
end

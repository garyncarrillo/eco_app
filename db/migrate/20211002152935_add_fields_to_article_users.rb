class AddFieldsToArticleUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :article_users, :account, :decimal
    add_column :article_users, :score, :decimal
  end
end

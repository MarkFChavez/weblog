class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :article_id
    add_index :comments, :user_id
  end
end

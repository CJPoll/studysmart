class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title
      t.string :body

      t.integer :sender_id

      t.timestamps null: false
    end

    create_table :message_recipients do |t|
      t.references :message
      t.references :user

      t.index :message_id
      t.index :user_id

      t.foreign_key :messages
      t.foreign_key :users
    end
  end
end

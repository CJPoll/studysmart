class AddUniversitiesUsersTable < ActiveRecord::Migration
  def change
    create_table :universities_users do |t|
      t.integer :university_id
      t.integer :user_id

      t.index :university_id
      t.index :user_id

      t.foreign_key :universities
      t.foreign_key :users
    end
  end
end

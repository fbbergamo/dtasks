class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.belongs_to :list
      t.belongs_to :user
      t.timestamps
    end
    add_index :favorites, [:list_id, :user_id], :unique => true
  end
end

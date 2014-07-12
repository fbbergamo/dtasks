class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :public?, :default => false
      t.belongs_to :user
      t.timestamps
    end
  end
end

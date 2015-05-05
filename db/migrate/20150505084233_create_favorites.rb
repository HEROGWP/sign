class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :device
      t.string :name
      t.text :address
      t.text :remark

      t.timestamps
    end
  end
end

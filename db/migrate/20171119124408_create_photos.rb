class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.integer :post_id
      t.string :avatar

      t.timestamps
    end
  end
end

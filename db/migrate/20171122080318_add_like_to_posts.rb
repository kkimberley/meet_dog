class AddLikeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :like, :Integer, default: 0
  end
end

class AddCreatorRefToPosts < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :creator, foreign_key: true
  end
end

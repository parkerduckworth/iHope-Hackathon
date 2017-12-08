class AddNameToCreators < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :name, :string
    add_column :creators, :blurb, :string
    add_column :creators, :bio, :string
  end
end

class AddNameToBox < ActiveRecord::Migration[6.1]
  def change
    add_column :boxes, :name, :string
  end
end

class CreateBoxes < ActiveRecord::Migration[6.1]
  def change
    create_table :boxes do |t|
      t.integer :size
      t.references :style
      t.references :sound

      t.timestamps
    end
  end
end

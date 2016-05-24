class CreateBelts < ActiveRecord::Migration
  def change
    create_table :belts do |t|
      t.string :name
      t.string :description
      t.integer :owner_id
      t.timestamps null: false
    end
  end
end

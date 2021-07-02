class CreateBills < ActiveRecord::Migration[6.0]
  def change
    create_table :bills do |t|
      t.string :name
      t.string :abstract
      t.string :status
      t.string :link
      t.timestamps
    end
  end
end

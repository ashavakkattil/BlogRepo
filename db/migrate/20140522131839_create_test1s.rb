class CreateTest1s < ActiveRecord::Migration
  def change
    create_table :test1s do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end

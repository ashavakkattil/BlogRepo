class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :name
      t.photo :has_attached_file

      t.timestamps
    end
  end
end

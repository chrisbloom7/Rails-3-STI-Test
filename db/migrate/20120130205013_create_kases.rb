class CreateKases < ActiveRecord::Migration
  def self.up
    create_table :kases do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :kases
  end
end

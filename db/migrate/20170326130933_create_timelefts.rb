class CreateTimelefts < ActiveRecord::Migration[5.0]
  def change
    create_table :timelefts do |t|
      t.integer :team
      t.integer :time
      t.integer :correct, :default => 0

      t.timestamps
    end
  end
end

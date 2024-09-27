class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.string :detaile, null: false
      t.date :deadline, null: false, default: -> { 'NOW()' }
      t.integer :status, null: false, default: 0
      t.integer :priority, null: false, default: 0

      t.timestamps
    end
  end
end

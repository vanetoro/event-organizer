class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :date
      t.integer :host_id
      t.integer :venue_id
    end
  end
end

class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.text :location
      t.text :date
      t.integer :host_id
    end
  end
end

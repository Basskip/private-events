class CreateEventAttendees < ActiveRecord::Migration[5.2]
  def change
    create_table :event_attendees, :id => false do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end
end

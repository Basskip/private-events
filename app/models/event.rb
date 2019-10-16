class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :event_attendees
    has_many :users, through: :event_attendees

    scope :past, -> { where('"when" < ?', Date.today) }
    scope :upcoming, -> { where('"when" >= ?', Date.today) }

end

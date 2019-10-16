class User < ApplicationRecord
    has_many :hosted_events, foreign_key: :creator_id, class_name: "Event"
    has_many :event_attendees
    has_many :attended_events, through: :event_attendees, source: :event

    def upcoming_events
        self.attended_events.where('"events"."when" >= ?', Date.today)
    end

    def previous_events
        self.attended_events.where('"events"."when" < ?', Date.today)
    end
end

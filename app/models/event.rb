class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  validates :title, presence: true
  validates :body, presence: true
  has_many :bookings, foreign_key: :attended_event_id
  has_many :attendees, through: :bookings, source: :attendee
end

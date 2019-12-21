class Event < ApplicationRecord
    validates :event_type, {presence: true}
    validates :event_name, {presence: true}
    validates :event_date, {presence: true}
    validates :event_place, {presence: true}
    validates :match_order, {presence: true}
    validates :fighter_r, {presence: true}
    validates :fighter_b, {presence: true}
end

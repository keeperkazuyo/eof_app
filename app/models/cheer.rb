class Cheer < ApplicationRecord
    belongs_to :user
    
    validates :user_id, {presence: true}
    validates :event_name, {presence: true}
    validates :match_order, {presence: true}
    validates :which_cheer, {presence: true}
end

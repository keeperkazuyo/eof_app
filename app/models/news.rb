class News < ApplicationRecord
     validates :title, {presence: true}
     validates :content, {presence: true}
     validates :posting_time, {presence: true}
end

class Item < ApplicationRecord
  belongs_to :scale
  has_many :responses
end

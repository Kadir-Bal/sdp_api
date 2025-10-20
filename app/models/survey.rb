class Survey < ApplicationRecord
  belongs_to :scale
  has_many :responses, dependent: :destroy
  has_one :analysis, dependent: :destroy
end

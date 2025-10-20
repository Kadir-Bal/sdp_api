class Scale < ApplicationRecord
  belongs_to :author, class_name: "User"   # bu doğru
  has_many :items
  has_many :surveys
end

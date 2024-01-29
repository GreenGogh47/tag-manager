class Status < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :color
  
  belongs_to :space
end
class Status < ApplicationRecord
  validates_presence_of :name,
                        # Type is a reserved word.
                        :orderindex,
                        :color
  
  belongs_to :space
end
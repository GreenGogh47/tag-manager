class Status < ApplicationRecord
  validates_presence_of :name,
                        :c_id,
                        # Type is a reserved word.
                        :orderindex,
                        :color
  
  belongs_to :space
end
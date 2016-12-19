class Book < ActiveRecord::Base
	belongs_to :type
	has_many :bookrent

	def self.search(query)
    where do 
      (name =~ "#{query}") |
      (isbn =~ "%#{query}%")
    end   
  end
end

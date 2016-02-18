class Place < ActiveRecord::Base
	# validates simple_form
	belongs_to :user
	has_many :comments
    #validate address
	geocoded_by :address
    after_validation :geocode
    #validate name, description, address
	validates :name, presence: true, length: {minimum: 4}
	validates :address, presence: true
	validates :description, presence: true


end

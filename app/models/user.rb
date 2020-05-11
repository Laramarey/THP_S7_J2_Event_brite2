class User < ApplicationRecord
	has_many :attendances
	has_many :events , through: :attendances
	belongs_to :admin , class_name: "User"


	validates :first_name, presence: true
  	validates :last_name, presence: true
  	validates :description, presence: true, length: { minimum: 10 }

end

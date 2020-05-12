class Event < ApplicationRecord
  has_many :attendances
  has_many :users , through: :attendances
  belongs_to :admin , class_name: "User"


  #je veux valider que la date est bien présente
  validates :start_date, presence: true 

  validates :duration, presence: true, :numericality => { :greater_than_or_equal_to => 0 }

  validate :multiple_of_5
#le validate des méthodes est au pluriel

  validates :title, presence: true, length: { in: 5..140 }

  validates :description, presence: true, length: { in: 20..1000 }

  validates :price, presence: true
  validates_inclusion_of :price, :in => 1..1000

  validates :location, presence: true

  def multiple_of_5
      if (self.duration % 5) != 0
      self.errors[:base] << "le nombre doit être un multiple de 5"
      end
  end

end

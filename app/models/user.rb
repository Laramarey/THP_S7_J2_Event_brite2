class User < ApplicationRecordafter_create :welcome_send  has_many :events, foreign_key: 'admin_id', class_name: "Event"  # validates :first_name, presence: true  # validates :last_name, presence: true  # validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please"}  # validates :description, presence: true, length: { minimum: 10 }    def welcome_send    UserMailer.welcome_email(self).deliver_now  endend
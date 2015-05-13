# This class represents a university in the database
class University < ActiveRecord::Base

  # Every university ought to have a name
  validates :name, presence: true

  # A university is composed of (potentially) many users, both students & tutors
  # alike.
  has_and_belongs_to_many :users
  has_many :courses
end

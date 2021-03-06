class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name,  presence: true

  has_and_belongs_to_many :universities
  has_many :messages, through: :message_recipients
  has_many :message_recipients

  has_many :sent_messages, class_name: 'Message'

  has_many :tutored_courses, class_name: 'Course', through: :offers, foreign_key: 'course_id'
  has_many :offers

  def attends? university
    self.universities.include? university
  end

  def stop_tutoring course
    self.tutored_courses.destroy course
  end

  def tutors course
    self.tutored_courses << course
  end

  def tutors? course
    self.tutored_courses.include? course
  end
end

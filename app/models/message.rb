class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  has_many :recipients, through: :message_recipients, source: :user, foreign_key: 'user_id'
  has_many :message_recipients

  validates_presence_of :recipients

  validates :sender, presence: true
  validates :body, presence: {message: "of message can't be blank"}
end

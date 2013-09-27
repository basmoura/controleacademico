class Course < ActiveRecord::Base
  attr_accessible :credits, :title, :teacher

  validates_presence_of :title, :credits
  validates_length_of  :title, maximum: 80
  validates_length_of  :teacher, maximum: 60
  validates_numericality_of :credits, greater_than: 1, less_than: 12

  before_create :set_current_user
  default_scope conditions: { user_id: Thread.current[:user] }

  has_many :works
  has_many :exams

  protected
  def set_current_user
    user_id = Thread.current[:user]
  end
end

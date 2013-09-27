class Exam < ActiveRecord::Base
  attr_accessible :dt_exam, :grade, :location, :course_id, :subjects_attributes

  validates_presence_of :course_id, :dt_exam
  validates_length_of :dt_exam, is: 10
  belongs_to :course
  has_many :subjects
  accepts_nested_attributes_for :subjects, allow_destroy: true

  before_create :set_current_user
  default_scope conditions: { user_id: Thread.current[:user] }

  def dt_exam
    read_attribute(:dt_exam).strftime("%d/%m/%Y") unless read_attribute(:dt_exam).nil?
  end
  self.per_page = 5

  private
  def set_current_user
    user_id = Thread.current[:user]
  end
end

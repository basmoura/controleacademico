class Exam < ActiveRecord::Base
  attr_accessible :dt_exam, :grade, :location, :matter_id, :subjects_attributes

  belongs_to :matter
  has_many :subjects
  accepts_nested_attributes_for :subjects
end

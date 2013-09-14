class Exam < ActiveRecord::Base
  attr_accessible :dt_exam, :grade, :location, :matter_id

  belongs_to :matter
end

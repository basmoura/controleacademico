class Subject < ActiveRecord::Base
  attr_accessible :exam_id, :name
  belongs_to :exam
end

class Grade < ActiveRecord::Base
  attr_accessible :exam_id, :matter_id, :unit_id, :user_id, :value
end

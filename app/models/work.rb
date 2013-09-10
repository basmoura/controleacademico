class Work < ActiveRecord::Base
  attr_accessible :matter_id, :title, :final_dt

  validates_presence_of :title, :final_dt, :matter_id

  belongs_to :matter
end

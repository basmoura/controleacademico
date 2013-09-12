class Work < ActiveRecord::Base
  attr_accessible :matter_id, :title, :final_dt

  validates_presence_of :title, :final_dt, :matter_id

  belongs_to :matter

  self.per_page = 5

  def final_dt
    read_attribute(:final_dt).strftime("%d/%m/%Y") unless read_attribute(:final_dt).nil?
  end
end

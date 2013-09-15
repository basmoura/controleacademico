class Work < ActiveRecord::Base
  attr_accessible :matter_id, :title, :final_dt

  validates_presence_of :title, :final_dt, :matter_id
  validates_length_of :title, maximum: 40
  validates_length_of :final_dt, is: 10
#  validate :final_dt_validation, before: [:create]
  belongs_to :matter

  self.per_page = 5

  def final_dt
    read_attribute(:final_dt).strftime("%d/%m/%Y") unless read_attribute(:final_dt).nil?
  end

#  private
#  def final_dt_validation
#    if DateTime.now.strftime("%d/%m/%Y") > final_dt
#      errors.add :final_dt, ""
#    end
#  end
end

class Work < ActiveRecord::Base
  attr_accessible :course_id, :title, :final_dt, :sections_attributes

  validates_presence_of :title, :final_dt, :course_id
  validates_length_of :title, maximum: 40
  validates_length_of :final_dt, is: 10
  #  validate :final_dt_validation, before: [:create]
  has_many :sections
  belongs_to :course
  accepts_nested_attributes_for :sections, allow_destroy: true

  self.per_page = 5

  def final_dt
    read_attribute(:final_dt).strftime("%d/%m/%Y") unless read_attribute(:final_dt).nil?
  end

  def sections_done(id)
    sections_stats(id)
  end

  def sections_percent(id)
   "#{sections_stats(id).round(2)}%"
  end

  private
  def sections_stats(id)
    @work = Work.find(id)

    unless @work.sections.empty?
      @work.sections.where("done = true").count.to_d / @work.sections.count.to_d * 100
    end
  end
  #  def final_dt_validation
  #    if DateTime.now.strftime("%d/%m/%Y") > final_dt
  #      errors.add :final_dt, ""
  #    end
  #  end
end

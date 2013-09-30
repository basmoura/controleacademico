class Work < ActiveRecord::Base
  attr_accessible :course_id, :title, :final_dt, :sections_attributes
  validates_presence_of :title, :final_dt, :course_id
  validates_length_of :title, maximum: 40
  validates_length_of :final_dt, is: 10
  has_many :sections
  belongs_to :course
  accepts_nested_attributes_for :sections, allow_destroy: true

  before_create :set_current_user
  default_scope conditions: { user_id: Thread.current[:user] }

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
    work = Work.find(id)

    unless work.sections.empty?
      value = work.sections.where("done = true").count.to_d / work.sections.count.to_d * 100
    end
    value ||= 0
  end

  def set_current_user
    user_id = Thread.current[:user]
  end
end

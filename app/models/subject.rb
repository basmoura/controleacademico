class Subject < ActiveRecord::Base
  attr_accessible :exam_id, :name
  belongs_to :exam

  before_create :set_current_user
  default_scope conditions: { user_id: Thread.current[:user] }

  private
  def set_current_user
    user_id = Thread.current[:user]
  end
end

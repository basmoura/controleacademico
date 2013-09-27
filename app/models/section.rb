class Section < ActiveRecord::Base
  attr_accessible :description, :done, :grade

  belongs_to :work
  before_create :set_current_user
  default_scope conditions: { user_id: Thread.current[:user] }

  private
  def set_current_user
    user_id = Thread.current[:user]
  end
end

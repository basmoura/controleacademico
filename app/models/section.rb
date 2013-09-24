class Section < ActiveRecord::Base
  attr_accessible :description, :done, :grade

  belongs_to :work
end

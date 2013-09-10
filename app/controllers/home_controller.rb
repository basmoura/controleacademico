class HomeController < ApplicationController
  def index
    @works = Work.all
    @work = Work.new
  end
end

class HomeController < ApplicationController
  def index
    @works = Work.all
  end
end

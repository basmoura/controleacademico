class HomeController < ApplicationController
  def index
    @works = Work.order("final_dt").paginate(page: params[:page])
    @work = Work.new
  end
end

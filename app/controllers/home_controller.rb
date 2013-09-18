class HomeController < ApplicationController
  def index
    @works = Work.order("final_dt").paginate(page: params[:page])
    @work = Work.new

    @exams = Exam.order("dt_exam").paginate(page: params[:page])
    @exam = Exam.new
    @exam.subjects.build
  end
end

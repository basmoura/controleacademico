class WorksController < ApplicationController
  before_filter :set_work, except: [:create]

  def create
    @work = Work.new(params[:work])
    if @work.save
      redirect_to root_path
      flash["alert alert-success"] = "Trabalho cadastrado com sucesso."
    else
      @works = Work.order("final_dt").paginate(page: params[:work_page])
      @exams = Exam.order("dt_exam").paginate(page: params[:exam_page])
      @exam = Exam.new
      @exam.subjects.build
      render "home/index"
    end
  end

  def edit
    render "home/index"
  end

  def update
    if @work.update_attributes(params[:work])
      redirect_to root_path
      flash["alert alert-success"] = "Trabalho atualizado com sucesso."
    else
      render "home/index"
    end
  end

  def destroy
    @work.destroy

    redirect_to root_path
    flash["alert alert-success"] = "Trabalho removido com sucesso."
  end

  def sections_done
    work.sections.where("done = true").count
  end

  private
  def set_work
    @works = Work.order("final_dt").paginate(page: params[:work_page])
    @work = Work.find(params[:id])
    @exams = Exam.order("dt_exam").paginate(page: params[:exam_page])
    @exam = Exam.new
    @exam.subjects.build
  end
end

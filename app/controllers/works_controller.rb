class WorksController < ApplicationController
  before_filter :set_work, except: [:new, :create]
  def new
    @work = Work.new

    render :layout => false
  end

  def create
    @work = Work.new(params[:work])
    if @work.save
      redirect_to root_path
      flash["alert alert-success"] = "Trabalho cadastrado com sucesso."
    else
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

  private
  def set_work
    @works = Work.order("final_dt").paginate(page: params[:work_page])
    @exams = Exam.order("dt_exam").paginate(page: params[:exam_page])
    @exam = Exam.new
    @exam.subjects.build
    @work = Work.find(params[:id])
  end
end

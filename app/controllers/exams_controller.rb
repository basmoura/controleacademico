class ExamsController < ApplicationController
  before_filter :set_exam, except: [:create]

  def create
    @exam = Exam.new(params[:exam])

    if @exam.save
      redirect_to root_path
      flash["alert alert-success"] = "Prova cadastrada com sucesso."
    else
      @exams = Exam.order("dt_exam").paginate(page: params[:page])
      render "home/index"
    end
  end

  def edit
    @exams = Exam.order("dt_exam").paginate(page: params[:page])
    render "home/index"
  end

  def update
    if @exam.update_attributes(params[:exam])
      redirect_to root_path
      flash["alert alert-success"] = "Prova atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @exam.destroy
    redirect_to root_path
    flash["alert alert-success"] = "Prova removida com sucesso."
  end

  private
  def set_exam
    @works = Work.order("final_dt").paginate(page: params[:work_page])
    @exams = Exam.order("dt_exam").paginate(page: params[:exam_page])
    @exam = Exam.find(params[:id])
    @work = Work.new
    @work.sections.build
  end
end


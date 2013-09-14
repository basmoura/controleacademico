class ExamsController < ApplicationController
  before_filter set_exam except: [:index, :new, :create]

  def index
    @exams = Exam.all
  end

  def show
  end

  def new
    @exam = Exam.new
    render :layout => false
  end

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
    @exam = Exam.find(params[:id])
  end
end


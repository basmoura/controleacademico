class WorksController < ApplicationController
  before_filter :set_work, except: [:index, :new, :create]

  def index
    @works = Work.all
  end

  def show

  end

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
      @works = Work.order("final_dt").paginate(page: params[:page])
      render "home/index"
    end
  end

  def edit
    @works = Work.order("final_dt").paginate(page: params[:page])
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
    @work = Work.find(params[:id])
  end

end

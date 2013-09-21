# encoding: UTF-8

class CoursesController < ApplicationController
  before_filter :set_course, except: [:index, :new, :create]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])
    if @course.save
      redirect_to courses_path
      flash["alert alert-success"] = "Matéria cadastrada com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update_attributes(params[:course])
      redirect_to courses_path
      flash["alert alert-success"] = "Matéria atualizada com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path
    flash["alert alert-success"] = "Matéria removida com sucesso."
  end

  private
  def set_course
    @course = Course.find(params[:id])
  end
end

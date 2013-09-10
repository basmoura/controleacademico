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
			redirect_to works_path
			flash["alert alert-success"] = "Trabalho cadastrado com sucesso."
		else
			render :new
		end
	end

	def edit
		render :layout => false
	end

	def update
		if @work.update_attributes(params[:work])
			redirect_to works_path
			flash["alert alert-success"] = "Trabalho atualizado com sucesso."
		else
			render :edit
		end
	end

	def destroy
		@work.destroy

		redirect_to works_path
		flash["alert alert-success"] = "Trabalho removido com sucesso."
	end

	private
	def set_work
		@work = Work.find(params[:id])
	end

end
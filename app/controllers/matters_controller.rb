# encoding: UTF-8

class MattersController < ApplicationController
	before_filter :set_matter, except: [:index, :new, :create]

	def index
		@matters = Matter.all
	end

	def show
	end

	def new
		@matter = Matter.new
	end

	def create
		@matter = Matter.new(params[:matter])

		if @matter.save
			redirect_to matters_path
			flash["alert alert-success"] = "Matéria cadastrada com sucesso."
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @matter.update_attributes(params[:matter])
			redirect_to matters_path
			flash["alert alert-success"] = "Matéria atualizada com sucesso."
		else
			render :edit
		end
	end

	def destroy
		@matter.destroy
		redirect_to matters_path
		flash["alert alert-success"] = "Matéria removida com sucesso."
	end

	private
	def set_matter
		@matter = Matter.find(params[:id])
	end
end
class QuestionsController < ApplicationController

	def index
		@questions = Question.search(params[:search])
	end

	def show 
		@question = Question.find(params[:id])
	end

	def new
		if user_signed_in?
			@question = Question.new
		else
			redirect_to new_user_session_path, notice: "Debe estar registrado para poder incluir una pregunta"
		end
	end

	def create
		@question = Question.new(question_params)
		if @question.save
			redirect_to question_path(@question.id), notice: "La pregunta fue adicionada correctamente"
		else
			render :new
		end
	end

	protected
	def question_params
		params.require(:question).permit(:title,:description,:user_id)
	end

end

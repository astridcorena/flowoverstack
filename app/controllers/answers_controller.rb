class AnswersController < ApplicationController

	def create
		@answer = Answer.new(answer_params)

		if @answer.save
			redirect_to question_path(@answer.question_id)
		end

	end

	protected
	def answer_params
		params.require(:answer).permit(:answertext,:question_id,:user_id)
	end


end

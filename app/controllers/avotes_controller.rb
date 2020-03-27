class AvotesController < ApplicationController

	def create
		answer = Answer.find(params[:answer_id])
		answer.avotes.create(user: current_user)

		redirect_to question_path(answer.question_id)
	end

	def destroy
		answer = Answer.find(params[:answer_id])
		answer.avotes.where(user: current_user).take.try(:destroy)

		redirect_to question_path(answer.question_id)
	end

end

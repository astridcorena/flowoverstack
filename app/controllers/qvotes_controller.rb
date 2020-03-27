class QvotesController < ApplicationController

	def create
		question = Question.find(params[:question_id])
		question.qvotes.create(user: current_user)

		#redirect_to question_path(question.id)
		redirect_to question_path(question.id)
	end

	def destroy
		question = Question.find(params[:question_id])
		question.qvotes.where(user: current_user).take.try(:destroy)

		redirect_to question_path(question.id)
	end

end

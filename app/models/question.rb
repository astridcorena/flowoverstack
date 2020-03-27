# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ApplicationRecord
  belongs_to :user

  has_many :qvotes
  has_many :answers
  has_many :comments, as: :commentable

  validates :title, :description, presence: true

  def qvoted_by?(user)
  	qvotes.exists?(user: user)
  end

  def self.search(search)
	  if search
	  	Question.where("title like ? OR description like ?", "%#{search}%", "%#{search}%").order(created_at: :desc)
	  else	
	  	Question.all.order(created_at: :desc)
	  end
  end
end

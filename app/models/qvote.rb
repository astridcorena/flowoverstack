# == Schema Information
#
# Table name: qvotes
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Qvote < ApplicationRecord
  belongs_to :question
  belongs_to :user
end

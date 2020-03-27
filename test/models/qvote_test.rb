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

require 'test_helper'

class QvoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

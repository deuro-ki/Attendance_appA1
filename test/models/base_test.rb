# == Schema Information
#
# Table name: bases
#
#  id          :integer          not null, primary key
#  base_number :integer
#  base_name   :string
#  base_status :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class BaseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

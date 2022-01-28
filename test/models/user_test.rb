# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  name                       :string           not null
#  email                      :string           not null
#  password_digest            :string
#  remember_digest            :string
#  admin                      :boolean          default(FALSE), not null
#  department                 :string
#  basic_time                 :datetime         default(Fri, 28 Jan 2022 08:00:00 JST +09:00), not null
#  work_time                  :datetime         default(Fri, 28 Jan 2022 07:30:00 JST +09:00), not null
#  superior                   :boolean          default(FALSE), not null
#  designated_work_start_time :datetime         default(Fri, 28 Jan 2022 09:00:00 JST +09:00), not null
#  designated_work_end_time   :datetime         default(Fri, 28 Jan 2022 18:00:00 JST +09:00), not null
#  finish_time                :datetime
#  affiliation                :string
#  employee_number            :integer
#  uid                        :string
#  title                      :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: attendance_change_approval_logs
#
#  id                              :integer          not null, primary key
#  worked_on                       :date             not null
#  started_at                      :datetime
#  finished_at                     :datetime
#  renewed_started_at              :datetime         not null
#  renewed_finished_at             :datetime         not null
#  user_id                         :integer          not null
#  approval_user_id                :integer          not null
#  approval_date                   :date             not null
#  frequent_changes_of_started_at  :datetime
#  frequent_changes_of_finished_at :datetime
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
# Indexes
#
#  index_attendance_change_approval_logs_on_approval_user_id  (approval_user_id)
#  index_attendance_change_approval_logs_on_user_id           (user_id)
#
class AttendanceChangeApprovalLog < ApplicationRecord
  
  belongs_to :user
  belongs_to :approval_user, class_name: 'User'

  validates :worked_on, presence: true
  validates :renewed_started_at, presence: true
  validates :renewed_finished_at, presence: true
  validates :approval_date, presence: true
  
end

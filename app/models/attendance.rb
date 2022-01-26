# == Schema Information
#
# Table name: attendances
#
#  id                              :integer          not null, primary key
#  worked_on                       :date
#  started_at                      :datetime
#  finished_at                     :datetime
#  note                            :string
#  next_day_check                  :boolean
#  user_id                         :integer          not null
#  contents                        :string
#  select_superior_id              :integer
#  superior_state                  :integer
#  modification                    :boolean
#  one_month_superior_id           :integer
#  one_month_status                :integer
#  apply_one_month                 :date
#  finish_time                     :datetime
#  tomorrow                        :boolean
#  renewed_started_at              :datetime
#  renewed_finished_at             :datetime
#  frequent_changes_of_started_at  :datetime
#  frequent_changes_of_finished_at :datetime
#  change_shift                    :boolean
#  change_month                    :boolean
#  description                     :string
#  attendance_state                :integer
#  superior_choice_id              :integer
#  one_month_superior_status       :string
#  overwork_superior_status        :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#
# Indexes
#
#  index_attendances_on_one_month_superior_id  (one_month_superior_id)
#  index_attendances_on_select_superior_id     (select_superior_id)
#  index_attendances_on_superior_choice_id     (superior_choice_id)
#  index_attendances_on_user_id                (user_id)
#
class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :select_superior, class_name: 'User', optional: true
  belongs_to :one_month_superior, class_name: 'User', optional: true
  belongs_to :superior_choice, class_name: 'User', optional: true
  
  validates :worked_on, presence: true
  validates :note, length: { maximum: 50 }
  
  validates :finish_time, presence: true, on: :update_overwork_request
  validates :contents, presence: true, length: {minimum: 3}, on: :update_overwork_request
  validates :select_superior_id, presence: true, on: :update_overwork_request

# 出勤時間が存在しない場合、退勤時間は無効
  validate :finished_at_is_invalid_without_a_started_at
  validate :started_at_than_finished_at_fast_if_invalid
  validate :renewed_started_at_than_renewed_finished_at_fast_if_invalid

  #validates :modification, inclusion: {in: [true]}

  def started_at_than_finished_at_fast_if_invalid
    #binding.pry
    if started_at.present? && finished_at.present? 
      errors.add(:started_at, "より早い退勤時間は無効です") if started_at > finished_at && tomorrow == false
    end
  end
  
  def renewed_started_at_than_renewed_finished_at_fast_if_invalid
    #binding.pry
    if renewed_started_at.present? && renewed_finished_at.present? 
      errors.add(:renewed_started_at, "より早い退勤時間は無効です") if renewed_started_at > renewed_finished_at && tomorrow == false
    end
  end

  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end
  
  
  
  
end

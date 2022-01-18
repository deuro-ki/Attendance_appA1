class CreateAttendanceChangeApprovalLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_change_approval_logs, comment: "勤怠変更承認ログ" do |t|
      t.date :worked_on, null: false, comment: "勤怠変更対象日"
      t.datetime :started_at, comment: "出勤時間"
      t.datetime :finished_at, comment: "退勤時間"
      t.datetime :renewed_started_at, null: false, comment: "変更後出勤時間"
      t.datetime :renewed_finished_at, null: false, comment: "変更後退勤時間"
      t.references :user, null: false, comment: "申請者"
      t.references :approval_user, foreign_key: { to_table: :users }, null: false, comment: "承認者"
      t.date :approval_date, null: false, comment: "承認日"
      t.datetime :frequent_changes_of_started_at, comment: "再変更出勤時間"
      t.datetime :frequent_changes_of_finished_at, comment: "再変更退勤時間"
      t.timestamps
    end
  end
end

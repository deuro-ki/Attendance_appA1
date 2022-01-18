class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.date :worked_on
      t.datetime :started_at, comment: "出勤時間"
      t.datetime :finished_at, comment: "退勤時間"
      t.string  :note
      t.boolean :next_day_check
      t.references :user, null: false
      t.string  :contents
      t.references :select_superior, foreign_key: { to_table: :users }, null: true, comment: "残業申請時の上長"
      t.integer :superior_state
      t.boolean :modification
      t.references :one_month_superior, foreign_key: { to_table: :users }, null: true, comment: "所属長承認時の上長"
      t.integer :one_month_status
      t.date :apply_one_month
      t.datetime :finish_time
      t.boolean :tomorrow
      t.datetime :renewed_started_at, comment: "変更後出勤時間"
      t.datetime :renewed_finished_at, comment: "変更後退勤時間"
      t.datetime :frequent_changes_of_started_at, comment: "再変更出勤時間"
      t.datetime :frequent_changes_of_finished_at, comment: "再変更退勤時間"
      t.boolean :change_shift
      t.boolean :change_month
      t.string :description
      t.integer :attendance_state
      t.references :superior_choice, foreign_key: { to_table: :users }, null: true, comment: "勤怠変更時の上長"
      t.string :one_month_superior_status
      t.string :overwork_superior_status
      t.timestamps 
    end
  end
end
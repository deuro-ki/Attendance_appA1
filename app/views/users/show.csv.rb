require 'csv'

CSV.generate do |csv|
 csv << ["勤怠情報"]
 column_names = %w(日付 出社時間 退社時間 備考)
 csv << column_names
 @attendances.each do |attehndance|
   column_values = [
   attendance.worked_on.strftime('%m/%d'),
   attendance.started_at.strftime("%m/%d"),
   attendance.finished_at.strftime("%m/%d"),
   attendance.note
  ]
   csv << column_values
 end
end
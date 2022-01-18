require 'csv'

CSV.generate do |csv|
 csv << ["勤怠情報"]
 column_names = %w(ユーザー名 メールアドレス 所属 社員番号 カードID 基本勤務時間  指定勤務開始時間 指定勤務終了時間 パスワード)
 csv << column_names
 @user.each do |user|
   column_values = [
   attendance.worked_on.strftime('%m/%d'),
   attendance.started_at.strftime("%m/%d"),
   attendance.finished_at.strftime("%m/%d"),
  ]
   csv << column_values
 end
end
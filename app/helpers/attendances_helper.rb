module AttendancesHelper
  def working_times(start, finish)
    #format("%.2f", (((finish - start) / 60) / 60.to_f * 0.6))
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  def renew_working_times(renewed_start, renewed_finish, attendance)
    if attendance.tomorrow
      #format("%.2f", (((renewed_finish - renewed_start) / 60) / 60.to_f * 0.6) + 24)
      format("%.2f", (((renewed_finish - renewed_start) / 60) / 60.0) + 24)
    else
      #format("%.2f", (((renewed_finish - renewed_start) / 60) / 60.to_f * 0.6))
      format("%.2f", (((renewed_finish - renewed_start) / 60) / 60.0))
    end
  end
  
  def frequent_changes_of_working_times(frequent_start, frequent_finish, attendance)
    if attendance.tomorrow
      format("%.2f", (((frequent_finish - frequent_start) / 60) / 60.0) + 24)
    else
      format("%.2f", (((frequent_finish - frequent_start) / 60) / 60.0))
    end
  end
  
  
  
  
  def format_min(time)
    format("%.2d", ((time.strftime('%M').to_i / 15).round) * 15)
    #format("%.2d", ((time.strftime('%M').to_i )))
  end
  
  def overtime_info(start_datetime, finish_datetime, attendance)
    if attendance.next_day_check
     #format("%.2f",(finish_datetime.hour - start_datetime.hour) + ((finish_datetime.min - start_datetime.min) / 60.to_f * 0.6) + 24)
     format("%.2f",(finish_datetime.hour - start_datetime.hour) + ((finish_datetime.min - start_datetime.min) / 60.to_f) + 24)
    else
    #binding.pry
     #format("%.2f",(finish_datetime.hour - start_datetime.hour) + ((finish_datetime.min - start_datetime.min) / 60.to_f * 0.6))
     format("%.2f",(finish_datetime.hour - start_datetime.hour) + (finish_datetime.min - start_datetime.min) / 60.to_f)
    end
  end
end

module AttendancesHelper
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  def format_min(time)
    format("%.2d", ((time.strftime('%M').to_i / 15).round) * 15)
  end
end

module UsersHelper
  
  def format_basic_info(time)
    #binding.pry
    format("%.2f", ((time.hour * 60.0) + time.min) / 60.0)
  end
  
  def designated_info(time)
    format("%.2f", ((time.hour * 60) + time.min) / 60)
  end
  
  def format_hour
    format("%.2f", (user.designated_work_start_time.to_i))
  end
  
  
end

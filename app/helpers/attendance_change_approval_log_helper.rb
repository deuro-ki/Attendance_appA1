module AttendanceChangeApprovalLogHelper
    
 def self.search(search)
  return Attendance_change_approval_logs.all unless search
   where(['year LIKE ?', 'month LIKE ?', "%#{search}%"])
 end
end

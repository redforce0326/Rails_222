class Reservation < ApplicationRecord
   belongs_to :user
   belongs_to :room
   def set_time_2
    start_time.strftime("%Y年%m月%d日")
   end 
   
   def set_time_3
    end_time.strftime("%Y年%m月%d日")
   end
   
   def set_time_4
     created_at.strftime("%Y年%m月%d日")
   end
   def amount_days
     ((end_time - start_time)/(60*60*24)).round
   end
  
   
end

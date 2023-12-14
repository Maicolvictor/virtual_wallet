module ApplicationHelper
   def date_br(datetime)
       datetime.strftime("%d/%m/%Y %H:%M:%S") if datetime.present?
   end
end

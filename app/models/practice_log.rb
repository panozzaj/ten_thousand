class PracticeLog < ActiveRecord::Base
  belongs_to :expertise
  belongs_to :user

  scope :between, lambda { |start_date, end_date| where :occurred_on => start_date..end_date }

  def practice_duration
    number = duration || 0
    ftime = ""
     
    hours = (number / 60).to_i
    ftime = hours.to_s if hours> 0
    number = number - (hours * 60)
    ftime += ":" if hours > 0 && number > 0 
    ftime +=  number.to_s if number > 0
    return ftime
  end
  def practice_duration=(ftime)
    if ftime.include?(":")
      hours, minutes = ftime.split(":")
      total_duration = hours.to_i * 60
      total_duration += minutes.to_i
      self.duration = total_duration
    else
      if ftime.match /^\d+$/
        self.duration = ftime.to_i
      else
        raise "Duration should be a number"
      end
    end
  end
end

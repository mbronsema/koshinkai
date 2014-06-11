module EventsHelper

  def multi(events)
    repeat = [];
    events.each do |event| 
      if event.repeat == 'Weekelijks' 
        if event.starting_at < (DateTime.now - 4.weeks)
          daysfor = {"Sat" => 1, "Sun" => 2, "Mon" => 3, "Tue" => 4, "Wed" => 5, "Thu" => 6, "Fri" => 7}
          numberold = 0
          numbernew = 0
          newtime = (DateTime.now - 4.weeks)
          new2time = newtime
          daysfor.each do |d, n|
            oldtime = event.starting_at 
            old2time = event.ending_at 
            newtime = newtime - (newtime.min).minutes + (oldtime.min).minutes - (newtime.sec).seconds + (oldtime.sec).seconds - (newtime.hour).hours + (oldtime.hour).hours
            new2time = newtime - (newtime.min).minutes + (old2time.min).minutes - (newtime.sec).seconds + (old2time.sec).seconds - (newtime.hour).hours + (old2time.hour).hours
            olddate = event.starting_at.strftime("%a") 
            newdate = (DateTime.now - 4.weeks).strftime("%a") 
            if olddate == d 
              numberold = n
            end
            if newdate == d 
              numbernew = n 
            end
          end
          if numberold < numbernew
            number1 = numbernew - numberold
          elsif numberold > numbernew
            number2 = numberold - numbernew
          else
            number3 = 0
          end
          if number1
            event.starting_at = newtime - number1.days 
            event.ending_at = new2time - number1.days 
          elsif number2
            event.starting_at = newtime + number2.days 
            event.ending_at = new2time + number2.days 
          else 
            event.starting_at = newtime + number3.days 
            event.ending_at = new2time + number3.days 
          end    
        end
        i = 0 
        while i < 364 do 
          data = {};
          b = event.starting_at + i.days
          e = event.ending_at + i.days
          data[:id] = event.id
          data[:title] = event.title
          data[:message] = event.message
          data[:begin] = b
          data[:end] = e
          i += 7
          repeat << data
        end 
      else 
        data2 = { id: event.id, title: event.title, message: event.message, begin: event.starting_at, end: event.ending_at}
        repeat << data2
      end
    end
    return repeat
  end
end
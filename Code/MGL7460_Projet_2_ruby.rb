def read_file(uptime_file)
  if File.exist? uptime_file
    if !File.empty? uptime_file
      File.read(uptime_file)
    else
      puts('File is empty')
    end
  else
    puts('File does not exist')
  end
end

def parse_time(time)
  result = Struct.new(:days, :hours, :minutes).new
  time = time.to_i
  result.days = time / 86_400
  time = time % 84_600
  result.hours = time / 3_600
  time %= 3_600
  result.minutes = time / 60
  result
end

def display_time(time_type, time)
  message = Time.new.strftime('%H:%M:%S') + " #{time_type} "
  message += time.days.positive? ? "#{time.days} day, " : ''
  message.insert(message.length - 2, 's') if time.days > 1
  message += time.hours.positive? ? "#{time.hours}:#{time.minutes}" : "#{time.minutes} min"
  puts message
end

uptime_file = '../uptime_file.txt'
times = read_file(uptime_file).split
unless times.empty?
  uptime = parse_time(times[0])
  idletime = parse_time(times[1])
  display_time('up', uptime)
  display_time('idle', idletime)
end

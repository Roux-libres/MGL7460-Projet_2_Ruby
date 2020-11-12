# frozen_string_literal: true

# read file and get his content thanks to his path
# input name:uptime_file type:string description:path
# output type:string
def read_file(uptime_file)
  raise('File doest not exist') unless File.exist? uptime_file

  File.read(uptime_file)
end

# Parse the initial time
# input name:time type:string
# output type:string[]
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

# Create a specific message depending on his content and display it
# input name:time_type type:string  description:type of time
# input name:time type:string  description:file's content
# output type: void
def display_time(time_type, time)
  message = Time.new.strftime('%H:%M:%S') + " #{time_type} "
  message += time.days.positive? ? "#{time.days} day, " : ''
  message.insert(message.length - 2, 's') if time.days > 1
  message += time.hours.positive? ? "#{time.hours}:#{time.minutes}" : "#{time.minutes} min"
  puts message
end

if __FILE__ == $PROGRAM_NAME
  uptime_file = '../uptime_file.txt'
  times = read_file(uptime_file).to_s.split
  raise('empty file') if times.empty?

  uptime = parse_time(times[0])
  idletime = parse_time(times[1])
  display_time('up', uptime)
  display_time('idle', idletime)
end

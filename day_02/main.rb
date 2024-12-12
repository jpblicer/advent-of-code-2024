def distance_safe?(report)
  report.each_cons(2) do |first, second|
    distance = first - second
    if distance.abs >= 3 || distance.abs == 0
      return false
    else
      return true
    end
  end
end

def safety_check(reports)
  safe = 0
  unsafe = 0
  reports.each do |report|
    distance_safe?(report) ? safe += 1 : unsafe +=1
  end
  puts "#{safe} reports are safe"
  puts "#{unsafe} reports are unsafe"
end

def line_to_array(line)
  array_line = line.split
  array_line.map { |num| num.to_i }
end

def deserializer
  reports = []
  input = File.foreach("input", "r") do |content|
    lines = content.split("\n")
    lines.each do |line|
      reports << line_to_array(line)
    end
  end
  reports
end

def main
  reports = deserializer
  safety_check(reports)
end

main

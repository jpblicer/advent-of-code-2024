def consistent_change_safe?(report)
  if report.each_cons(2).all? {|first, second| second > first }
    return true
  elsif report.each_cons(2).all? {|first, second| second < first }
    return true
  else
    return false
  end
end


def safe_report_with_dampener?(levels)
  # Check if the report is safe without removing any level
  return true if is_safe_report?(levels)

  # Try removing one level at a time and check if it becomes safe
  (0...levels.size).each do |i|
    new_levels = levels[0...i] + levels[(i+1)..-1]
    return true if is_safe_report?(new_levels)
  end

  false  # If none of the levels can be removed to make the report safe
end


def second_check?(report)
  report.each_cons(2) do |first, second|
    distance = first - second
    if distance.abs > 3 || distance.abs == 0
      return false
    end
    true
  end
end

def problem_dampened?(report)
  report.each_cons(2) do |first, second|
    distance = first - second
    if distance.abs > 3 || distance.abs == 0
      report.delete(report.find_index(first))
      second_check?(report)
    end
    true
  end
end

def distance_safe?(report)
  report.each_cons(2) do |first, second|
    distance = first - second
    if distance.abs > 3 || distance.abs == 0
      problem_dampened?(report)
    end
    true
  end
end

def safety_check(reports)
  safe = 0
  unsafe = 0
  reports.each do |report|
    distance_safe?(report) && consistent_change_safe?(report) ? safe +=1 : unsafe +=1
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


# Test
test_reports =[[7,6,4,2,1],[1,2,7,8,9],[9,7,6,2,1],[1,3,2,4,5],[8,6,4,4,1],[1,3,6,7,9]]
safety_check(test_reports)

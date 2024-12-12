def line_to_array(line)
  array_line = line.split
  integer_array_line = array_line.map { |num| num.to_i }
  p integer_array_line
end

def deserializer
  input = File.foreach("input", "r") do |content|
    lines = content.split("\n")
    lines.each do |line|
      line_to_array(line)
    end
  end
end

def main
  deserializer
end

main

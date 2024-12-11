def main
  rowA = []
  rowB = []
  input = File.open("input", "r") do |f|
    f.each_line do |line|
      numbers = line.split(' ').each_with_index do |number, index|
        puts "next is #{number}with index of #{index}"
        index == 0 ? rowA << number : rowB << number
      end
    end
  end
  puts rowA
  puts rowB
end

main

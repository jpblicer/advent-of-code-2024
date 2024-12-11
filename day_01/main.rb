def order_rows(rowA, rowB)
  sorted_rowA = rowA.map.sort
  sorted_rowB = rowB.map.sort
end

def parse_file_rows
  rowA = []
  rowB = []
  input = File.open("input", "r") do |f|
    f.each_line do |line|
      numbers = line.split(' ').each_with_index do |number, index|
        index == 0 ? rowA << number : rowB << number
      end
    end
  end
  order_rows(rowA, rowB)
end

def main
  parse_file_rows
end

main

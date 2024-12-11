def compare_rows(rowA, rowB)
  puts rowA
end

def sort_rows(rowA, rowB)
  sorted_rowA = rowA.map.sort
  sorted_rowB = rowB.map.sort
  compare_rows(sorted_rowA, sorted_rowB)
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
  sort_rows(rowA, rowB)
end

def main
  parse_file_rows
end

main

## begin...rescue
def divide_by_zero_example
  num = 0
  begin
    puts "dividing 10 by #{num}"
    ans = 10 / num
    puts "the answer is #{ans}"
  rescue
    puts "there is an error with that division"
  end
end

# divide_by_zero_example


## raise example
def format_name(first, last)
  if !(first.instance_of?(String) && last.instance_of?(String))
    raise "arguments must be string"
  end

  first.capitalize + " " + last.capitalize
end

p format_name("grace", "HOPPER")
p format_name(42, "zafar")
require_relative "../test_helper"

test = Test.new("Single vs Double Quoted Strings (FizzBuzz)", runs: 100)

test.add_variant "Single Quoted" do
  100000.times do |n|
    string = ''
    string << 'Fizz' if n % 3 == 0
    string << 'Buzz' if n % 5 == 0
    puts string.empty? ? n : string
  end
end

test.add_variant "Double Quoted" do
  100000.times do |n|
    string = ""
    string << "Fizz" if n % 3 == 0
    string << "Buzz" if n % 5 == 0
    puts string.empty? ? n : string
  end
end

test.report

# Results: https://s3.amazonaws.com/kurtzkloud.com/ss/Screen_Shot_2015-01-12_at_11.03.33.png

require_relative "../test_helper"

test = Test.new("Single vs Double Quoted Strings (Explicit Parsing)", runs: 100)

test.add_variant "Single Quoted" do
  100000.times do
    eval <<-such_parsing
    'abc'
    such_parsing
  end
end

test.add_variant "Double Quoted" do
  100000.times do
    eval <<-such_parsing
    "abc"
    such_parsing
  end
end

test.report

# Results: https://s3.amazonaws.com/kurtzkloud.com/ss/Screen_Shot_2015-01-22_at_09.12.28.png

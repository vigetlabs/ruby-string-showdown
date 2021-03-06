require_relative "../test_helper"

test = Test.new("Single vs Double Quoted Strings (Small Instantiation)", runs: 100)

test.add_variant "Single Quoted" do
  1000000.times do
    'abc'
  end
end

test.add_variant "Double Quoted" do
  1000000.times do
    "abc"
  end
end

test.report

# Results: https://s3.amazonaws.com/kurtzkloud.com/ss/Screen_Shot_2015-01-12_at_14.34.53.png

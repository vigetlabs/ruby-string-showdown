require_relative "../test_helper"

test = Test.new("Single vs Double Quoted Strings (Interpolation vs Concat)", runs: 100)

test.add_variant "Single Quoted" do
  1000000.times do
    'Hello' << 'world'
  end
end

test.add_variant "Double Quoted" do
  1000000.times do
   "Hello #{"world"}"
  end
end

test.report

# Results: https://s3.amazonaws.com/kurtzkloud.com/ss/Screen_Shot_2015-01-12_at_14.40.12.png

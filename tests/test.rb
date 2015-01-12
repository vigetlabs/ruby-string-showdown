require_relative "../test_helper"

test = Test.new("The Test Test (should always yield significant difference)", runs: 100)

test.add_variant "Fast" do
  1000000.times do
    "Foo"
  end
end

test.add_variant "Slow" do
  1000000.times do
    "Foobar"
  end
end

test.report

# Results: https://s3.amazonaws.com/kurtzkloud.com/ss/Screen_Shot_2015-01-12_at_10.47.24.png

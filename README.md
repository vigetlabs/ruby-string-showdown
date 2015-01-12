# Ruby String Showdown
## What is this?
This repository contains a test harness for A/B testing Ruby code performance as well as a number of tests comparing the performance of double vs single quoted strings.

## How to run the tests
### Prerequisites:
- Ruby (This was built on Ruby version 2.2.0, but other versions should work fine.)
- Bundler (`gem install bundler` will do the trick.)

### Instructions
Clone the repository

`git clone git@github.com:vigetlabs/ruby-string-showdown.git`

Move into the directory

`cd ruby-string-showdown`

Install dependencies

`bundle install`

Run the tests

`ruby tests/fizzbuzz.rb`

## How to write your own test
Follow the installation instructions above.

Make a new file within the `tests` directory.

Require the `test_helper.rb` file.
```ruby
require_relative "../test_helper"
```

Then instantiate a test providing a name for the test and the number of times the test variants should be executed.
```ruby
test = Test.new("My Cool Test", runs: 42)
```

Then add your variants to test, providing a name to identify the variant, and a block of code whose performance you would like to measure.
```ruby
test.add_variant("Version A") do
    woodchuck.chuck_capacity if woodchuck.could_chuck?(:wood)
end
```

After adding your variants, print a performance statistics report to STDOUT via: `test.report`

class TestVariant
  include Enumerable

  attr_reader :name, :results

  def initialize(name, operation)
    @name = name
    @operation = operation
    @results = []
  end

  def results_vector
    @results_vector ||= results.to_scale(name: name)
  end

  def run
    redirecting_stdout do
      Benchmark.measure { operation.call }
    end
  end

  private

  def redirecting_stdout
    prev_stdout = $stdout.clone
    $stdout.reopen(File.new("/dev/null", "w"))
    yield
  ensure
    $stdout.reopen(prev_stdout)
  end

  attr_reader :operation
end

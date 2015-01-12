class Test
  def initialize(name, options = {})
    @name = name
    @variants = {}
    @runs = options.fetch(:runs, 1)
    @results = {}
  end

  def add_variant(name, &operation)
    variants[name] = TestVariant.new(name, operation)
  end

  def report
    puts "#{name} Test"
    puts "Running tests..."
    run
    puts "Tests complete. Results:"

    if variants.size == 2
      puts ttest.summary
    else
      if variants.size > 2
        puts "Skipping T-Test because there are more than two test variants. An ANOVA is recommended instead, but is not yet implemented here."
      else
        puts "Skipping T-Test because there is only one test variant."
      end

      variants.each do |name, variant|
        puts "#{name} | Mean: #{variant.results.mean}, Median: #{variant.results.median}, Std Dev: #{variant.results.standard_deviation}"
      end
    end
  end

  private

  def result_vectors
    result_vectors ||= variants.first(2).map do |name, variant|
      variant.results_vector
    end
  end

  def ttest
    @ttest ||= Statsample::Test::T::TwoSamplesIndependent.new(*result_vectors, name: "Variant T-Test")
  end

  def run
    runs.times do |n|
      print "  #{n} of #{runs}\r"

      variants.map{|_,v|v}.shuffle.each do |variant|
        variant.results << variant.run.utime
      end
    end
  end


  attr_reader :name, :runs, :variants
end

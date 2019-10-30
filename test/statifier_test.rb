require "test_helper"

class StatifierTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Statifier::VERSION
  end
end

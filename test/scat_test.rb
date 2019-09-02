require "test_helper"

class ScatTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Scat::VERSION
  end
end

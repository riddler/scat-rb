require "test_helper"

class StaartTest < Minitest::Test
  include Staart::FixtureHelpers

  def test_that_it_has_a_version_number
    refute_nil ::Staart::VERSION
  end

  def test_statechart_from_scxml
    xmldoc = scion_scxml "basic", "basic0"
    statechart = Staart.statechart_from_scxml xmldoc

    assert_kind_of Staart::Statechart, statechart
    assert_equal %w[ a ], statechart.initial
  end
end

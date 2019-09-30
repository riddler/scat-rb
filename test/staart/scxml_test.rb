require "test_helper"

module Staart
  class ScxmlTest < Minitest::Test
    include Staart::FixtureHelpers

    def test_initial_attribute
      statechart = Staart::Scxml.parse_statechart <<-XML
        <scxml initial="a">
          <state id="a"/>
        </scxml>
      XML

      assert_equal %w[ a ], statechart.initial
    end

    def test_no_initial_attribute
      statechart = Staart::Scxml.parse_statechart <<-XML
        <scxml>
          <state id="a"/>
        </scxml>
      XML

      assert_nil statechart.initial
    end
  end
end

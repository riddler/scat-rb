$LOAD_PATH.unshift File.expand_path "../lib", __dir__
require "staart"

require "hashdiff"
require "json"
require "pathname"
require "ox"

require "minitest/autorun"
require "minitest/focus"
require "minitest/pride"

module Staart
  module ScxmlHelpers
    def test_machines folder, files
      Array(files).each do |file|
        define_method "test_scxml_#{folder}_#{file}" do
          scxml_path = "./test/fixtures/scxml/#{folder}/#{file}.scxml"
          test_path = "./test/fixtures/scxml/#{folder}/#{file}.json"
          test_config = JSON.parse File.read test_path

          machine = Staart.machine_from_file scxml_path
          assert_equal_hash test_config["initialConfiguration"],
            machine.configuration

          #Enum.reduce(test_config["events"], machine, fn test_case, acc ->
          #  new_machine = acc |> Staart.Machine.send(test_case["event"]["name"])
          #  assert (new_machine |> Staart.Machine.configuration_literal) == test_case["nextConfiguration"]
          #  new_machine
          #end)
        end
      end
    end
  end
end

module MiniTest::Assertions
  def assert_equal_hash expected, actual, message = "Hashes are not equal: "
    diff = ::Hashdiff.diff expected, actual

    assert diff.empty?, -> {
      message_lines = [message, expected.to_s, actual.to_s]
      message_lines += diff.map { |arr| arr.join " " }

      message_lines.join "\n"
    }
  end
end

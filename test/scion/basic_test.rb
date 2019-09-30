require "test_helper"

module Scion
  class BasicTest < Minitest::Test
    def test_scxml_basic_basic0
      skip
      folder = "basic"
      file = "basic0"
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

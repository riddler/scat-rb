require "test_helper"

class W3cTest < Minitest::Test
  def test_3_2
    skip
    base_path = "./test/w3c/3.2/test355"

    scxml_path = Pathname.new [base_path, ".scxml"].join
    description_path = Pathname.new [base_path, ".description"].join

    scxml = File.read scxml_path
    description = File.read description_path

    #doc = Ox.parse scxml
    #clean_xml = Ox.dump doc

    test_case = {
      description: description.strip,
      scxml: Ox.dump(Ox.parse(scxml))
    }

    p test_case
  end
end

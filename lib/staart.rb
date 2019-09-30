require "staart/version"

require "staart/machine"
require "staart/scxml"

module Staart
  class Error < StandardError; end

  module_function

  def machine_from_file path
    xmldoc = File.read File.expand_path path
    statechart = Staart::Scxml.parse_statechart xmldoc
    Staart::Machine.new statechart
  end
end

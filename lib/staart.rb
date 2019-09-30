require "staart/version"

require "staart/machine"
require "staart/scxml"
require "staart/statechart"

module Staart
  class Error < StandardError; end

  module_function

  def machine_from_file path
    xmldoc = File.read File.expand_path path
    statechart = Staart::Scxml.parse_statechart xmldoc
    Staart::Machine.new statechart
  end

  def statechart_from_scxml xmldoc
    Staart::Scxml.parse_statechart xmldoc
  end
end

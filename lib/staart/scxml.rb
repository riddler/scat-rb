require "ox"

module Staart
  module Scxml
    module_function

    def parse_statechart xmldoc
      hash = Ox.load xmldoc, mode: :hash

      root = state_from_ox hash[:scxml]

      statechart = ::Staart::Statechart.new root: root
      statechart
    end

    def state_from_ox input
      attrs = {}
      children = {}

      if input.kind_of? Hash
        children = input
      elsif input.kind_of? Array
        attrs = input.first
        children = input.last
      end

      #children = children_hashes.map{ |child| state_from_hash child }

      state_hash = {}
      state_hash[:initial] = [attrs[:initial]] if attrs.key? :initial
      state_hash
    end
  end
end

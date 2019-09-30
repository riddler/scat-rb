module Staart
  class Statechart
    def initialize root:
      @root = root
    end

    def initial
      @root[:initial]
    end
  end
end

module Postwiki

  class User

    attr_reader :wiki

    def initialize(wiki)
      @wiki = wiki
    end
  end
end

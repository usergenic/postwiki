module Postwiki

  class Link

    attr_reader :wiki
    attr_accessor :id
    attr_accessor :source
    attr_accessor :tag
    attr_accessor :target

    def initialize(wiki, attributes={})
      @wiki   = wiki
      @source = attributes[:source]
      @tag    = attributes[:tag]
      @target = attributes[:target]
      @id     = attributes[:id]
    end

    def new?
      ! id
    end

    def save
      wiki.save_link(self)
    end
  end
end

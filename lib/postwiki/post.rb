module Postwiki

  class Post

    def self.create(wiki, attributes={})
      post = new(wiki, attributes)
      post.save
      post
    end

    attr_reader :wiki
    attr_reader :name
    attr_accessor :id
    attr_accessor :text

    def initialize(wiki, attributes={})
      @wiki = wiki
      @name = attributes[:name]
      @id   = attributes[:id]
    end

    def links
      wiki.find_links_for(self)
    end

    def new?
      ! id
    end

    def save
      wiki.save_post(self)
    end
  end
end

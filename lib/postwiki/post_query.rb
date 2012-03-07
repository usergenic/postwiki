module Postwiki

  class PostQuery

    attr_reader :wiki

    def initialize(wiki)
      @wiki = wiki
    end

    def create(attributes={})
      Post.create(wiki, attributes)
    end

    def find_by_name(name)
      wiki.find_post_by_name(name)
    end
  end
end

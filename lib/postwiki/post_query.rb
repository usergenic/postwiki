module Postwiki

  class PostQuery

    attr_reader :scope, :wiki

    def initialize(wiki, scope={})
      @wiki, @scope = wiki, scope
    end

    def create(attributes)
      post = new(attributes)
      post.save
      post
    end

    def find(attributes)
      wiki.find_post(scope.merge(attributes))
    end

    def find_or_create(attributes)
      find(attributes) or create(attributes)
    end

    def new(attributes={})
      Post.new(wiki, scope.merge(attributes))
    end
  end
end

module Postwiki

  class LinkQuery

    attr_reader :scope, :wiki

    def initialize(wiki, scope={})
      @wiki, @scope = wiki, scope
    end

    def create(attributes={})
      link = new(attributes)
      link.save
      link
    end

    def find(attributes)
      wiki.find_link(scope.merge(attributes))
    end

    def find_or_create(attributes={})
      find(attributes) or create(attributes)
    end

    def new(attributes={})
      Link.new(wiki, scope.merge(attributes))
    end
  end
end

module Postwiki

  class Store::InMemory < Store

    def initialize
      @next_id = 0
    end

    def find_links_for(post)
      links.select do |link|
        link.source == post or
        link.tag == post or
        link.target == post
      end
    end

    def find_post_by_name(name)
      posts[name]
    end

    def insert_post(post)
      posts[post.name] = post
      post.id = next_id
    end

    def next_id
      @next_id += 1
    end

    def links
      @links ||= []
    end

    def posts
      @posts ||= {}
    end

    def update_post(post)
      # the update is a noop when using the in-memory store
    end
  end
end

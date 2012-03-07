module Postwiki

  class Wiki

    attr_reader :store

    def initialize(store)
      @store = store
    end

    def find_links_for(post)
      store.find_links_for(post)
    end

    def find_post_by_name(name)
      store.find_post_by_name(name)
    end

    def links
      @links ||= LinkQuery.new(self)
    end

    def posts
      @posts ||= PostQuery.new(self)
    end

    def save_post(post)
      if post.new?
        store.insert_post(post)
      else
        store.update_post(post)
      end
    end
  end
end

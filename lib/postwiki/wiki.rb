module Postwiki

  class Wiki

    attr_reader :store

    def initialize(store)
      @store = store
    end

    def find_histories(attributes)
      store.find_histories(attributes).map do |history_data|
        History.new(self, history_data)
      end
    end

    def find_links(attributes)
      store.find_links(attributes).map do |link_data|
        Link.new(self, link_data)
      end
    end

    def find_post(attributes)
      post_data = store.find_post(attributes)
      Post.new(self, post_data) if post_data
    end

    def links(scope={})
      @links ||= LinkQuery.new(self, scope)
    end

    def posts(scope={})
      @posts ||= PostQuery.new(self, scope)
    end

    def save_history(history)
      if history.new?
        store.insert_history(history.data)
      else
        store.update_history(history.data)
      end
    end

    def save_link(link)
      if link.new?
        store.insert_link(link.data)
      else
        store.update_link(link.data)
      end
    end

    def save_post(post)
      if post.new?
        store.insert_post(post.data)
      else
        store.update_post(post.data)
      end
    end
  end
end

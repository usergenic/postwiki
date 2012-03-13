module Postwiki

  class Store::InMemory < Store

    def initialize
      @next_id = 0
    end

    def find_histories(attributes)
      histories.select do |history|
        attributes.all? do |key, value|
          history.send(key) == value
        end
      end
    end

    def find_links(attributes)
      links.select do |link|
        attributes.all? do |key, value|
          link.send(key) == value
        end
      end
    end

    def find_post(attributes)
      if attributes.key?(:name)
        return posts[attributes[:name]]
      end
    end

    def insert_link(link)
      links << link
      link.id = next_id
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

    def update_link(link)
      # the update is a noop when using the in-memory store
    end

    def update_post(post)
      # the update is a noop when using the in-memory store
    end
  end
end

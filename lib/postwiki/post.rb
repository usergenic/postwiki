module Postwiki

  class Post

    Data = Struct.new :id, :name, :text

    def self.from_data(data)
      self.id, self.name, self.text = data.id, data.name, data.text
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

    def data
      Data.new(id, name, text)
    end

    def histories
      wiki.find_histories(:post => self)
    end

    def links
      wiki.find_links(:source => self) +
      wiki.find_links(:tag    => self) +
      wiki.find_links(:target => self)
    end

    def new?
      ! id
    end

    def save
      wiki.save_post(self)
    end
  end
end

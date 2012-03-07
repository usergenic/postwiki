require 'postwiki'
require 'postwiki/store/in_memory'
require 'ostruct'

World do
  world       = OpenStruct.new
  world.store = Postwiki::Store::InMemory.new
  world.wiki  = Postwiki::Wiki.new(world.store)
  world
end

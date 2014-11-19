module Printfection
  class Relation
    include Enumerable
    extend Forwardable
    def_delegators :@children, :each, :first, :last, :size, :count, :length

    def initialize(parent:, children:, path:, keys:)
      @parent   = parent
      @children = children
      @path     = path
      @keys     = keys

      @keys.each do |primary, foreign|
        children.each { |child| child[foreign] = parent[primary] }
      end
    end

    def uri
      [@parent.uri, @path].join("/").gsub("//", "/")
    end

  end
end


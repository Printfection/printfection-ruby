module Printfection
  class Relation
    include Enumerable
    extend Forwardable
    def_delegators :@children, :each, :first, :last, :size, :count, :length

    def initialize(options={})
      options = {
        parent:   nil,
        children: [],
        klass:    Hashie::Mash,
        path:     "",
        keys:     {},
        actions:  []
      }.merge(options)

      @parent   = options.fetch(:parent)
      @children = options.fetch(:children)
      @klass    = options.fetch(:klass)
      @path     = options.fetch(:path)
      @keys     = options.fetch(:keys)
      @actions  = options.fetch(:actions)

      @actions.each do |mod|
        self.extend(mod)
      end

      @keys.each do |primary, foreign|
        @children.each do |child|
          child[foreign] = @parent[primary]
        end
      end
    end

    def uri
      [@parent.uri, @path].join("/").gsub("//", "/")
    end

    def new(*args)
      @klass.new(*args)
    end

  end
end


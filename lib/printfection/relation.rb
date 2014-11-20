module Printfection
  class Relation
    include Enumerable
    extend Forwardable
    def_delegators :@children, :each, :first, :last, :size, :count, :length

    attr_reader :parent, :children, :klass, :path, :keys, :actions

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

      actions.each do |mod|
        self.extend(mod)
      end

      children.each do |child|
        apply_keys(child)
      end
    end

    def uri
      [parent.uri, path].join("/").gsub("//", "/")
    end

    def new(*args)
      child = klass.new(*args)
      apply_keys(child)
      return child
    end

    private

    def apply_keys(child)
      keys.each do |primary, foreign|
        child[foreign] = parent[primary]
      end
    end

  end
end


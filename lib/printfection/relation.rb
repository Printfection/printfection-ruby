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
        apply_relation(child)
      end
    end

    def uri
      Util.join_uri(parent.uri, path)
    end

    def new(*args)
      child = klass.new(*args)
      apply_relation(child)
      return child
    end

    private

    def apply_relation(child)
      keys.each do |primary, foreign|
        child[foreign] = parent[primary]
      end

      if child.respond_to? :relation=
        child.relation = self
      end
    end

  end
end


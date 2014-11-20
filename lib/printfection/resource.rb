module Printfection
  class Resource < Hashie::Trash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::Coercion

    property :object

    attr_accessor :relation

    def initialize(*args)
      super
      @_old = self.dup
    end

    def uri
      base = self.relation.nil? ? self.class.uri : self.relation.uri
      Util.join_uri(base, self.id)
    end

    def changes
      keys.inject({}) do |diff, key|
        unless self[key] == @_old[key]
          diff[key] = self[key]
        end
        diff
      end
    end

  end
end


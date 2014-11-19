module Printfection
  class Resource < Hashie::Trash
    include Hashie::Extensions::IndifferentAccess
    include Hashie::Extensions::Coercion
    property :object

    def initialize(*args)
      super
      @_old = self.dup
    end

    def uri
      [self.class.uri, id].join("/")
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


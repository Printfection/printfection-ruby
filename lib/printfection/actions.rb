module Printfection
  module Actions

    module Retrieve
      def retrieve(id)
        new Printfection.get Util.join_uri(self.uri, id)
      end
    end

    module List
      def all(params={})
        Printfection.get(self.uri, params).map do |response|
          new response
        end
      end
    end

    module Create
      def create(params)
        new Printfection.post self.uri, params
      end
    end

    module Update
      def save
        Printfection.patch self.uri, changes
        true
      end
    end

    module Delete
      def delete
        Printfection.delete self.uri
        true
      end
    end

  end
end


module Printfection
  module Actions

    module Retrieve
      def retrieve(id)
        new Printfection.get [self.uri, id].join("/")
      end
    end

    module List
      def all
        Printfection.get(self.uri).map do |response|
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
      end
    end

    module Delete
      def delete
        Printfection.delete self.uri
      end
    end

  end
end


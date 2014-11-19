module Printfection
  module Actions

    module Retrieve
      def retrieve(id)
        new Printfection.get [self.url, id].join("/")
      end
    end

    module List
      def all
        Printfection.get(self.url).map do |response|
          new response
        end
      end
    end

    module Create
      def create(params)
        new Printfection.post(self.url, params)
      end
    end

    module Update
      def save
        Printfection.patch [self.class.url, id].join("/"), changes
      end
    end

    module Delete
      def delete
        Printfection.delete [self.class.url, id].join("/")
      end
    end

  end
end


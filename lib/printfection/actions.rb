module Printfection
  module Actions

    module Retrieve
      module ClassMethods
        def retrieve(id)
          new Printfection.get [self.url, id].join("/")
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end

    module List
      module ClassMethods
        def list
          Printfection.get(self.url).map do |response|
            new response
          end
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end
    end

    module Create
      module ClassMethods
        def create(params)
          new Printfection.post(self.url, params)
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
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


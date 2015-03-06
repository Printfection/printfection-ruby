require 'printfection'

module Printfection
  describe Relation do
    it "behaves like a collection" do
      author   = {id: 1}
      books    = [{title: "Book 1"}, {title: "Book 2"}]

      relation = Relation.new(
        parent:   author,
        children: books,
        path:     '/books',
        keys:     {:id => :author_id}
      )

      expect(relation.size).to eql (2)
      expect(relation.length).to eql (2)
      expect(relation.count).to eql (2)

      titles = relation.map { |book| book[:title] }
      expect(titles).to eql ["Book 1", "Book 2"]
    end

    it "applies the parent keys to the children" do
      author   = {id: 1, name: "Mark Twain"}
      books    = [{title: "Book 1"}, {title: "Book 2"}]

      relation = Relation.new(
        parent:   author,
        children: books,
        path:     '/books',
        keys:     {:id => :author_id, :name => :author_name}
      )

      expect(relation.first).to eql({title: "Book 1", author_id: 1, author_name: "Mark Twain"})
      expect(relation.last).to eql({title: "Book 2", author_id: 1, author_name: "Mark Twain"})
    end

    it "applies the relation to the childrenance" do
      book_klass = Class.new(Resource) do
        property :title
        property :author_id
        property :author_name
      end

      author   = {id: 1, name: "Mark Twain"}
      books    = [book_klass.new({title: "Book 1"}), book_klass.new({title: "Book 2"})]

      relation = Relation.new(
        children: books
      )

      expect(relation.first.relation).to eql relation
      expect(relation.last.relation).to eql relation
    end


    it "includes the provided actions" do
      parent   = double.as_null_object
      children = double.as_null_object

      action1 = Module.new do
        def action1_action
        end
      end

      action2 = Module.new do
        def action2_action
        end
      end

      relation = Relation.new(
        parent:   parent,
        children: children,
        actions:  [action1, action2]
      )

      expect(relation).to respond_to :action1_action
      expect(relation).to respond_to :action2_action
    end
  end

  describe Relation, "#uri" do
    it "returns a URI for collection actions" do
      author = double(:author, uri: "/authors/1").as_null_object
      books = [{title: "Book 1"}, {title: "Book 2"}]

      relation = Relation.new(
        parent:   author,
        children: books,
        path:     '/books',
        keys:     {:id => :author_id}
      )

      expect(relation.uri).to eql "/authors/1/books"
    end
  end

  describe Relation, "#new" do
    it "invokes the constructor of the child class and returns the result" do
      author = double(:author, uri: "/authors/1").as_null_object
      books = [{title: "Book 1"}, {title: "Book 2"}]

      klass = Class.new
      instance = double.as_null_object

      relation = Relation.new(
        parent:   author,
        children: books,
        klass:    klass,
        path:     '/books',
        keys:     {:id => :author_id}
      )

      expect(klass).to receive(:new).
                       with({id: 123, age: 12, quantity: 100}).
                       and_return(instance)

      expect(relation.new({id: 123, age: 12, quantity: 100})).to eql instance
    end

    it "applies the parent keys to the new instance" do
      author = {id: 1, name: "Mark Twain"}

      relation = Relation.new(
        parent:   author,
        klass:    Hashie::Mash,
        keys:     {:id  => :author_id, :name => :author_name}
      )

      instance = relation.new({
        id: 2,
        author_id: 2
      })

      expect(instance[:id]).to eql 2
      expect(instance[:author_id]).to eql 1
      expect(instance[:author_name]).to eql "Mark Twain"
    end

    it "applies the relation to the new instance" do
      author = double(:author, :uri => "/authors/123").as_null_object

      relation = Relation.new(
        parent: author,
        klass: Resource
      )

      instance = relation.new
      expect(instance.relation).to eql relation
    end
  end
end


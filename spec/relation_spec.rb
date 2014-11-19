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

    it "transforms the parent keys onto the children" do
      author   = {id: 1}
      books    = [{title: "Book 1"}, {title: "Book 2"}]

      relation = Relation.new(
        parent:   author,
        children: books,
        path:     '/books',
        keys:     {:id => :author_id}
      )

      expect(relation.first).to eql({title: "Book 1", author_id: 1})
      expect(relation.last).to eql({title: "Book 2", author_id: 1})
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
end


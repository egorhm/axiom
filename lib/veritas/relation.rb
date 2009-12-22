module Veritas
  class Relation
    include Enumerable

    attr_reader :header, :body

    def initialize(header, body)
      @header, @body = header, body
    end

    def each(&block)
      body.each(&block)
      self
    end

    def join(other)
      Algebra::Join.new(self, other)
    end

    alias + join

    def product(other)
      Algebra::Product.new(self, other)
    end

    alias * product

    def intersect(other)
      Algebra::Intersection.new(self, other)
    end

    alias & intersect

    def union(other)
      Algebra::Union.new(self, other)
    end

    alias | union

    def difference(other)
      Algebra::Difference.new(self, other)
    end

    alias - difference

    def ==(other)
      header == other.header &&
      body   == other.body
    end

    def eql?(other)
      instance_of?(other.class) &&
      header.eql?(other.header) &&
      body.eql?(other.body)
    end
  end # class Relation
end # module Veritas

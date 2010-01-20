module Veritas
  module Algebra
    class Restriction
      class Proposition
        include Optimizable
        include Connective::Methods

        def self.new(*args)
          if args.empty?
            super
          else
            (args.first ? True : False).new
          end
        end

        def invert
          raise NotImplementedError, "#{self.class.name}#invert must be implemented"
        end

        def call(*)
          self.class.eval
        end

        def eql?(other)
          instance_of?(other.class)
        end

        def hash
          @hash ||= call.hash
        end

        def inspect
          raise NotImplementedError, "#{self.class.name}#inspect must be implemented"
        end

        def self.eval
          raise NotImplementedError, "#{name}.eval must be implemented"
        end

      end # class Proposition

      class True < Proposition
        def self.eval
          true
        end

        def invert
          False.new
        end

        def inspect
          'true'
        end

      end # class True

      class False < Proposition
        def self.eval
          false
        end

        def invert
          True.new
        end

        def inspect
          'false'
        end

      end # class False
    end # class Restriction
  end # module Algebra
end # module Veritas
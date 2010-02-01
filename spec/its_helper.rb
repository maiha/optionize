module Spec
  module Example
    module Subject
      module ExampleGroupMethods
        def its(*args, &block)
          describe(its_pretty_title(args)) do
            define_method(:subject) { super().send(*args) }
            it(&block)
          end
        end

        private
          def its_pretty_title(args)
            return args.first if args.size == 1
            key  = args.first.to_s
            vals = args[1..-1]
            if key == '[]'
              vals.inspect
            else
              "%s(%s)" % [key, vals.map{|i|i.to_s}.join(', ')]
            end
          end
      end
    end
  end
end


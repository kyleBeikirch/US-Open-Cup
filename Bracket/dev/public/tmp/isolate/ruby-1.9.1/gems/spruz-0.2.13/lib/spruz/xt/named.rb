require 'spruz/xt/string_version'

class Object
  if RUBY_VERSION.version >= '1.9'.version
    def named(name, method, *args, &named_block)
      extend Module.new {
        define_method(name) do |*rest, &block|
          block = named_block if named_block
          __send__(method, *(args + rest), &block)
        end
      }
    end
  else
    def named(name, method, *args, &block)
      extend Module.new { define_method(name) { |*rest| __send__(method, *(args + rest), &block) } }
    end
  end
end

class Module
  if RUBY_VERSION.version >= '1.9'.version
    def named(name, method, *args, &named_block)
      include Module.new {
        define_method(name) do |*rest, &block|
          block = named_block if named_block
          __send__(method, *(args + rest), &block)
        end
      }
    end
  else
    def named(name, method, *args, &block)
      include Module.new { define_method(name) { |*rest| __send__(method, *(args + rest), &block) } }
    end
  end
end

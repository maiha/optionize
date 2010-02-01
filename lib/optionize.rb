class Optionize
  attr_reader :names

  def initialize(given, *names)
    static  = names.last.respond_to?(:merge) ? names.pop : {}
    dynamic = given.last.respond_to?(:merge) ? given.pop : {}

    @names = names.map{|i| i.to_s}
    @hash  = {}

    # static
    static.each_pair{|key, val| self[key] = val }

    # dynamic
    dynamic.each_pair{|key, val| self[key] = val }

    # given
    given.each_with_index do |value, i|
      key = names[i] or
        raise IndexError, "expected %d args but got %s %s" % [names.size, i+1, given.inspect]
      self[key] = value
    end
  end

  def [](key)
    @hash[key.to_s]
  end

  def []=(key, val)
    @hash[key.to_s] = val
  end

  def named_values
    names.map{|name| self[name]}
  end

  private
    def method_missing(name, *args)
      if name.to_s =~ /(.*)=$/
        self[$1] = args.first
      else
        self[name]
      end
    end
end


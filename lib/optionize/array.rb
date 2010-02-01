class Array
  def optionize(*args)
    Optionize.new(self, *args)
  end
end

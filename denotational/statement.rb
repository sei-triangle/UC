class Assign < Struct.new(:name, :expression)
  def to_s
    "#{name} = #{expression}"
  end
  def inspect
    "<#{self}>"
  end
  def to_ruby
    "-> e { e.merge({ #{name.inspect} => (#{expression.to_ruby}).call(e) }) }"
  end
end

class DoNothing
  def to_s
    "DoNothing"
  end
  def inspect
    "<#{self}>"
  end
  def to_ruby
    '-> e { e }'
  end
end

class If < Struct.new(:condition, :consequence, :alternative)
  def to_s
    "if (#{condition}) { #{consequence} } else { #{alternative} }"
  end
end

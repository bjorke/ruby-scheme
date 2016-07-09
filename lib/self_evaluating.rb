module Self_evaluating
  def self.self_evaluating(exp)
    !!Float(exp)
  rescue ArgumentError, TypeError
    false
  end
end

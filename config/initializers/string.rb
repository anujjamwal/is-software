class String
  def snake_case
    gsub(/\B[A-Z]/, '_\&').gsub(/\s+/, '_').downcase
  end
end

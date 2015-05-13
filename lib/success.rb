class Success
  def initialize success
    @success = success
  end

  def as_json options = {}
    return "{success:#{@success} }"
  end
end

module Exceptions
  class MysteryError < StandardError
  end

  while check_for_errors 
    begin
      if Post.count == 0 
        1/0
      end
      raise "what the fuck just happened?"
    rescue self
    end
  end

end


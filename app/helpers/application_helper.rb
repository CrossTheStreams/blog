module ApplicationHelper
  #shout out! https://gist.github.com/1628032
  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end

end

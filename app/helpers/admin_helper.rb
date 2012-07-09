module AdminHelper

  def list_keywords(arr)
    keyword_list = ""
    arr.each do |tag|
      keyword_list << tag.keyword + ", "
    end
    keyword_list.chomp(", ")
  end

  def published?(state)
    if state == true
      "<span class='Published'>Published</span>".html_safe
    else 
      "<span class='Unpublished'>Unpublished</span>".html_safe
    end
  end
end

class Tag < ActiveRecord::Base
  belongs_to :post
  belongs_to :keyword
  

  # Returns the json for the tag bubble chart.
  #
  # post array : Array : An array of post objects

  def self.bubble_hash(post_array)
    keyword_arr = []
    post_array.map {|p| keyword_arr.concat(p.keywords)}
    keyword_arr.uniq!
    tag_counts = keyword_arr.map do |k| 
      {"keyword" => k.name, "count" => Tag.where(:keyword_id => k.id).count}
    end
    return {"name" => "tags", "children" => tag_counts}  
  end

end

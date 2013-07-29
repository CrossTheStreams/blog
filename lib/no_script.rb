module NoScript 

  # Since I'm a crazy person, the initial build of this app relies on client side logic for user facing content.
  # This method dispatches according to a path string given, with the returned posts being handled by the posts/noscript partial.
  # This will render content in noscript tags, which makes the app work without javascript enabled— important for SEO.
  #
  # request_path : string : the path requested in main#index
  # admin : boolean : if true, render unpublished posts
  #
  def self.dispatcher(request_path,admin=false)
    request_path = request_path.split("/")  
    if request_path.length > 1
      request_path = request_path.delete_if {|str| str.blank?}
    end
    action = request_path[0].to_s
    param1 = request_path[1].to_s
    param2 = request_path[2].to_s
    ret = []
    Rails.logger.debug("+++++ You're in the noscript_dispatcher!! action = #{action}")
    case action
      when ""
        Rails.logger.debug("Dispatched to index. param1 = #{param1} ++++++") 
        admin ? ret = Post.admin_list(1,false) : ret = Post.list(1,false)
      when "posts"
        Rails.logger.debug("Dispatched to 'posts'. param1 = #{param1} ++++++")
        ret = [Post.find(param1)] rescue [] 
      when "page"
        Rails.logger.debug("Dispatched to 'page'. param1 = #{param1} ++++++")
        admin ? ret = Post.admin_list(param1,false) : ret = Post.list(param1,false)
      when "search"
        Rails.logger.debug("Dispatched to 'search'. param1 = #{param1} ++++++")
        ret = Post.blog_search(param1)        
      when "tag"
        Rails.logger.debug("Dispatched to 'tag'. param1 = #{param1} ++++++")
        ret = Post.search_by_keyword(param1) rescue []
    end
    ret ||= []
    return ret
  end

end

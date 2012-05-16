(function() {

  describe("Posts Collection", function() {
    return it("should use the api url", function() {
      return expect(Blog.Collections.Posts.prototype.url).toEqual('/api/posts');
    });
  });

}).call(this);

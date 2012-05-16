(function() {

  describe('Posts Template', function() {
    return describe('First Post', function() {
      return it('should be the first post', function() {
        return this.collection = new Blog.Collections.Posts();
      });
    });
  });

}).call(this);

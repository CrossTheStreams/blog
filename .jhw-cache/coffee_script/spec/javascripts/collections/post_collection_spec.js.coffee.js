(function() {

  describe("Posts Collection", function() {
    return it("should use the api url", function() {
      return expect(Posts.prototype.url(toEqual('/api/posts')));
    });
  });

}).call(this);

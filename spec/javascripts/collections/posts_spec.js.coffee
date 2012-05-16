describe "Posts Collection", ->
  it "should use the api url", ->
    expect(Blog.Collections.Posts::url).toEqual '/api/posts'

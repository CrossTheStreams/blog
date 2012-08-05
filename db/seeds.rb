## This file should contain all the record creation needed to seed the database with its default values.
## The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
##
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
##   Mayor.create(name: 'Emanuel', city: cities.first)

Keyword.create(:name => "Beer")
Keyword.create(:name => "Javascript")
Keyword.create(:name => "Ruby")
Keyword.create(:name => "Awesome")
Keyword.create(:name => "Coffescript")
Keyword.create(:name => "Code")
Keyword.create(:name => "Music")
Keyword.create(:name => "Cats")
Keyword.create(:name => "Golden Retrievers")

post1 = Post.create!(title: "First Post", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.", 
             published: true,
             date_published: DateTime.now)
   
post2 = Post.create!(title: "Second Post", 
             content: "Kale chips seitan viral pour-over sustainable cred, art party leggings selvage. Whatever butcher mcsweeney's american apparel hella portland. You probably haven't heard of them irony aesthetic street art DIY high life keytar messenger bag small batch. Keytar twee ethnic, synth bespoke high life you probably haven't heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.", 
             published: true,
             date_published: DateTime.now)

post3 = Post.create!(title: "Third Post", 
             content: 'h1. The thing about kale chips.

             Kale chips seitan viral "pour-over sustainable cred, art party leggings":http:localhost:3000 selvage. Whatever butcher mcsweeneys american apparel hella portland. You probably haven&rsquo;t heard of them irony aesthetic street art DIY high life keytar messenger *bag small batch. Keytar twee ethnic,* synth bespoke high life you probably haven&rsquo;t heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.

              * an item
              * and another

              # one
              # two',
             published: true,
             date_published: DateTime.now)

post4 = Post.create!(title: "Unpublished Post", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             published: false)

post5 = Post.create!(title: "Even More Posts!", 
             content: "Kale chips seitan viral pour-over sustainable cred, art party leggings selvage. Whatever butcher mcsweeney's american apparel hella portland. You probably haven't heard of them irony aesthetic street art DIY high life keytar messenger bag small batch. Keytar twee ethnic, synth bespoke high life you probably haven't heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.",
             published:true,
             date_published: DateTime.now)

post6 = Post.create!(title: "Even More Posts!", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             published:true,
             date_published: DateTime.now)

post7 = Post.create!(title: "Even More Posts!", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             published:true,
             date_published: DateTime.now)

Keyword.where(:name => ["Ruby", "Javascript", "Code"]).map {|k| Tag.create(:post_id => post1.id, :keyword_id => k.id)}
Keyword.where(:name => ["Ruby", "Javascript", "Code"]).map {|k| Tag.create(:post_id => post2.id, :keyword_id => k.id)}
Keyword.where(:name => ["Ruby", "Music"]).map {|k| Tag.create(:post_id => post3.id, :keyword_id => k.id)}
Keyword.where(:name => ["Beer", "Awesome", "Music", "Food"]).map {|k| Tag.create(:post_id => post4.id, :keyword_id => k.id)}
Keyword.where(:name => ["Cats", "Golden Retrivers", "Music"]).map {|k| Tag.create(:post_id => post5.id, :keyword_id => k.id)}
Keyword.where(:name => ["Cats", "Golden Retrivers", "Music"]).map {|k| Tag.create(:post_id => post6.id, :keyword_id => k.id)}
Keyword.where(:name => ["Music","Code", "Golden Retrivers"]).map {|k| Tag.create(:post_id => post7.id, :keyword_id => k.id)}

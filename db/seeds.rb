## This file should contain all the record creation needed to seed the database with its default values.
## The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
##
## Examples:
##
##   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
##   Mayor.create(name: 'Emanuel', city: cities.first)

tags = ["Beer", "Javascript",
        "Ruby", "Awesome", 
        "Cool", "Photos", 
        "Facts", "Coffescript", 
        "Code", "Music", 
        "Cats", "Golden Retrievers"]

tags.each {|t| Tag.create!(:keyword => t)}

Post.create!(title: "First Post", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.", 
             public: true,
             tags: Tag.where(:keyword => ["Ruby", "Javascript"])
            )
   
Post.create!(title: "Second Post", 
             content: "Kale chips seitan viral pour-over sustainable cred, art party leggings selvage. Whatever butcher mcsweeney's american apparel hella portland. You probably haven't heard of them irony aesthetic street art DIY high life keytar messenger bag small batch. Keytar twee ethnic, synth bespoke high life you probably haven't heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.", 
             public: true,
             tags: Tag.where(:keyword => ["Ruby", "Javascript"])
            )

Post.create!(title: "Third Post", 
             content: 'h1. The thing about kale chips.

             Kale chips seitan viral "pour-over sustainable cred, art party leggings":http:localhost:3000 selvage. Whatever butcher mcsweeneys american apparel hella portland. You probably haven&rsquo;t heard of them irony aesthetic street art DIY high life keytar messenger *bag small batch. Keytar twee ethnic,* synth bespoke high life you probably haven&rsquo;t heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.

              * an item
              * and another

              # one
              # two',
             public: true,
             tags: Tag.where(:keyword => ["Ruby", "Music"])
            )

Post.create!(title: "Unpublished Post", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             public: false,
             tags: Tag.where(:keyword => ["Beer", "Awesome"])
            )

Post.create!(title: "Even More Posts!", 
             content: "Kale chips seitan viral pour-over sustainable cred, art party leggings selvage. Whatever butcher mcsweeney's american apparel hella portland. You probably haven't heard of them irony aesthetic street art DIY high life keytar messenger bag small batch. Keytar twee ethnic, synth bespoke high life you probably haven't heard of them organic lo-fi fingerstache vinyl williamsburg hoodie.",
             public:true,
             tags: Tag.where(:keyword => ["Cats", "Golden Retrivers"])
            )

Post.create!(title: "Even More Posts!", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             public:true,
             tags: Tag.where(:keyword => ["Photos", "Code"])
            )

Post.create!(title: "Even More Posts!", 
             content: "Single-origin coffee 8-bit mustache master cleanse. Photo booth odd future seitan, mustache pinterest banh mi aesthetic twee put a bird on it truffaut. Pickled jean shorts godard art party iphone, blog pitchfork cliche vice marfa shoreditch.",
             public:true,
             tags: Tag.where(:keyword => ["Ruby", "Music"])
            )


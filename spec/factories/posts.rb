FactoryGirl.define do
  factory :firstpost, class: Post do
    title "First Post"
    content "Stuff blah blah blah"
  end
  factory :post do
    title "Another Post!"
    content "More stuff blah blah blah"
  end
end

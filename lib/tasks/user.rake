# http://railscasts.com/episodes/66-custom-rake-tasks

namespace :user do
  desc "Create a user for the blog. Must give name, email, password, and password confirmation arguments."
  task :create => :environment do
    new_user = User.create(:name => ENV['name'], :email => ENV['email'], :password => ENV['password'], :password_confirmation => ENV['password_confirmation'])
  end
end

namespace :developer do
  desc "Enable/disable staging environment. When disabled, staging will redirect to production environment."
  task :staging_switch => :environment do
    feature = Feature.find_by_name("staging_on")
    if Rails.env == "staging" 
      if feature
        new_state = !feature.active
        feature.update_attribute(:active, new_state)
        if new_state
          puts "Staging environment is now accessible."
        else
          puts "Staging environment now redirects to production environment." 
        end
        
      end
    else
      puts "Silly rabbit! This is for the staging environment!"
    end
  end
end


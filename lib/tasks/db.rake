namespace :db do
  desc "run db:drop, db:create, db:migrate and db:seed tasks in a row."
  task :rebuild => :environment do
    unless Rails.env.production?
      system "rake db:drop"
      system "rake db:create"
      system "rake db:migrate"
      system "rake db:seed"
    end
  end
end

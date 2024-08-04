# frozen_string_literal: true
namespace :db do
    namespace :seed do
      desc 'Load the custom seed data from db/seeds/my_custom_filename_seed.rb'

      # bundle exec rake db:seed:single SEED=author_seed
      
      task single: :environment do
        puts "Seeding #{ENV['SEED']}..."
        filename = Dir[File.join(Rails.root, 'db', 'seeds', "#{ENV['SEED']}.rb")][0]
        puts "Seeding #{filename}..."
        load(filename) if File.exist?(filename)
      end
    end
  end
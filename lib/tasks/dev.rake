namespace :dev do
  unless Rails.env == 'production'
    require 'rspec/core/rake_task'
    require 'rubocop/rake_task'

    desc 'Execute Rspec'
    RSpec::Core::RakeTask.new(:spec) do |tsk|
      tsk.rspec_opts = '--format p'
    end

    desc 'Execute rubocop -DR'
    RuboCop::RakeTask.new(:rubocop) do |tsk|
      tsk.options = ['-DR'] # Rails, display cop name
      tsk.fail_on_error = false
    end

    # require 'reek/rake/task'
    # desc 'Execute reek'
    # Reek::Rake::Task.new do |tsk|
    #   tsk.source_files = ['app/**/*.rb', 'lib/**/*.rb', 'lib/tasks/*.rake', 'config/**/*.rb']
    #   tsk.fail_on_error = false
    #   # tsk.verbose = true
    # end

    # desc 'Execute haml-lint'
    # task haml_lint: :environment do
    #   puts 'HAML-LINT'
    #   puts %x(haml-lint .)
    # end

    # desc 'Execute rails_best_practices'
    # task rbp: :environment do
    #   require 'rails_best_practices'
    #   analyzer = RailsBestPractices::Analyzer.new('.')
    #   analyzer.analyze
    #   puts analyzer.output
    # end

  end
end

task :testcode do
  %w(spec rubocop).each { |task| Rake::Task["testcode:#{task}"].invoke }
end
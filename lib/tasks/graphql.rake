# frozen_string_literal: true

namespace :graphql do
  namespace :schema do
    task dump: :environment do
      require 'graphql/rake_task'

      GraphQL::RakeTask.new(
        load_schema: ->(_task) {
          ShibeRailsSchema
        },
        directory: '../shibe-flutter/lib'
      )
      Rake::Task['graphql:schema:idl'].invoke
    end
  end
end

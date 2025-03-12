# frozen_string_literal: true

require 'faker'

10.times do |_i|
  Task.create(name: Faker::Name.unique.name,
              description: Faker::Lorem.sentence,
              status: ['done', 'another status'].sample,
              creator: Faker::Name.unique.name,
              completed: [true, false].sample)
end

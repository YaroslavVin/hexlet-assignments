# frozen_string_literal: true

100.times do |i|
  Article.create(title: "yaroslav title #{i}", body: "yaroslav body #{i}")
end
# frozen_string_literal: true

class Task < ApplicationRecord
  validates :name, :status, :creator, :completed, presence: true
  validates :name, length: { minimum: 3, maximum: 20 }

  attribute :creator, default: 'base creator'
  attribute :completed, default: true
  attribute :status, default: 'pending'
end

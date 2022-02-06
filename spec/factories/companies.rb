# frozen_string_literal: true

FactoryBot.define do
  factory :company do
    sequence(:company_number) { |n| n }
  end
end

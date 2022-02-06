# frozen_string_literal: true

class Company < ApplicationRecord
  validates :company_number, presence: true, uniqueness: { case_sensitive: false }
end

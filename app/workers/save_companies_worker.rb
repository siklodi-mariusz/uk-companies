# frozen_string_literal: true

class SaveCompaniesWorker
  include Sidekiq::Worker

  def perform(companies_data)
    companies_data.each do |company|
      SaveOrUpdateCompanyWorker.perform_async(company)
    end
  end
end

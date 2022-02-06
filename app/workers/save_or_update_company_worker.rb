# frozen_string_literal: true

class SaveOrUpdateCompanyWorker
  include Sidekiq::Worker

  def perform(company_data)
    company = Company.find_or_initialize_by(company_number: company_data['company_number'])
    company.update!(data: company_data)
  end
end

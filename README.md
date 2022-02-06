# CompaniesHouse UK

This repository contains a basic implementation of a Rails app that queries the [Companies House UK Public Data API]

## Tech stack

* Ruby version: 3.0.3

* Rails: 7.0.1

### Dependencies

* PostgreSQL: 10.19

* Redis: 6.2.6

## Setup

1.
        bundle install
2.
        bin/rails s

App should start and be running on [http://localhost:3000](http://localhost:3000)

## Database initialization

1.
        bin/rails db:create

2.
        bin/rails db:schema:load

## Services

1. Sidekiq is used for background jobs processing. Start it with:

        bundle exec sidekiq

## API credentials

The app must be configured with a valid API key in order to request companies data and is expected to be included in rails credentials store `config/credentials.yml.enc` with the following format:

    companies_api:
      base_url: https://api.company-information.service.gov.uk
      api_key: <API-KEY>

[Companies House UK Public Data API]:https://developer-specs.company-information.service.gov.uk/companies-house-public-data-api/reference

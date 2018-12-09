# frozen_string_literal: true

require 'rest-client'
module AutomobileService
  API_URL = 'https://vpic.nhtsa.dot.gov/api'
  def self.list_brands
    endpoint = '/vehicles/getallmakes'
    brands = api_call_to_json(endpoint)
    brands
      .sort_by! { |brand| brand['Make_Name'] }
      .map { |brand| { id: brand['Make_ID'], brand: brand['Make_Name'] } }
  end

  def self.list_make_year_models(make_id, year)
    endpoint = "/vehicles/GetModelsForMakeIdYear/makeId/#{make_id}/modelyear/#{year}"
    cars = api_call_to_json(endpoint)
    cars.map { |car| { id: car['Model_ID'], model:  car['Model_Name'] } }
  end

  private

  def self.api_call_to_json(endpoint)
    JSON.parse(RestClient.get(API_URL + endpoint, params: { format: :json }).body)['Results']
  end
end

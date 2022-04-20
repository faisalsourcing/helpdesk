#DevsQuest, https://devsquest.com/

require 'integration_test_helper'

class GeoIpTest < ActiveSupport::TestCase

  # check
  test 'check some results' do

    result = Service::GeoIp.location('127.0.0.0.1')
    assert(result)
    assert_nil(result['country_name'])
    assert_nil(result['city_name'])
    assert_nil(result['country_code'])
    assert_nil(result['continent_code'])
    assert_nil(result['latitude'])
    assert_nil(result['longitude'])

    result = Service::GeoIp.location('127.0.0.1')
    assert(result)
    assert_nil(result['country_name'])
    assert_nil(result['city_name'])
    assert_nil(result['country_code'])
    assert_nil(result['continent_code'])
    assert_nil(result['latitude'])
    assert_nil(result['longitude'])

    result = Service::GeoIp.location('195.65.29.254')
    assert(result)
    assert_equal('Switzerland', result['country_name'])
    assert_equal('Niederhasli', result['city_name'])
    assert_equal('CH', result['country_code'])
    assert_equal('EU', result['continent_code'])
    assert_equal(47.4823, result['latitude'])
    assert_equal(8.4823, result['longitude'])

    result = Service::GeoIp.location('134.109.140.74')
    assert(result)
    assert_equal('Germany', result['country_name'])
    assert_equal('Chemnitz', result['city_name'])
    assert_equal('DE', result['country_code'])
    assert_equal('EU', result['continent_code'])
    assert_equal(50.8191, result['latitude'])
    assert_equal(12.9419, result['longitude'])

    result = Service::GeoIp.location('46.253.55.170')
    assert(result)
    assert_equal('Germany', result['country_name'])
    assert_equal('Halle', result['city_name'])
    assert_equal('DE', result['country_code'])
    assert_equal('EU', result['continent_code'])
    assert_equal(51.4825, result['latitude'])
    assert_equal(11.9772, result['longitude'])

    result = Service::GeoIp.location('169.229.216.200')
    assert(result)
    assert_equal('United States', result['country_name'])
    assert_equal('Oakland', result['city_name'])
    assert_equal('US', result['country_code'])
    assert_equal('NA', result['continent_code'])
    assert_equal(37.8376, result['latitude'])
    assert_equal(-122.2398, result['longitude'])
  end
end

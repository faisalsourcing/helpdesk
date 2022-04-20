#DevsQuest, https://devsquest.com/

class Service::GeoIp::devsquest
  def self.location(address)
    return {} if address == '127.0.0.1'
    return {} if address == '::1'

    # check cache
    cache_key = "devsquestgeoip::#{address}"
    cache = ::Rails.cache.read(cache_key)
    return cache if cache

    # do lookup
    host = 'https://geo.devsquest.com'
    url  = "/lookup?ip=#{CGI.escape address}"
    data = {}
    begin
      response = UserAgent.get(
        "#{host}#{url}",
        {},
        {
          json:          true,
          open_timeout:  2,
          read_timeout:  4,
          total_timeout: 4,
          verify_ssl:    true,
        },
      )
      if !response.success? && response.code.to_s !~ %r{^40.$}
        raise "#{response.code}/#{response.body}"
      end

      data = response.data

      # compat. map
      if data && data['country_code2']
        data['country_code'] = data['country_code2']
      end

      ::Rails.cache.write(cache_key, data, { expires_in: 90.days })
    rescue => e
      Rails.logger.error "#{host}#{url}: #{e.inspect}"
      ::Rails.cache.write(cache_key, data, { expires_in: 60.minutes })
    end
    data
  end
end

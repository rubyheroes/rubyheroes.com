module URI::GenericHacks

  # URI.parse("http://four.three.two.one").subdomain => "two.one"
  # URI.parse("http://four.three.two.one").subdomain(3) => "three.two.one"
  def subdomain(level = 2)
    raise ArgumentError unless level > 0
    parts = host.split "."
    parts.shift while parts.length > level
    parts.join "."
  end
  
  # This is the only reason that the open_id_authentication library was included.
  def self.normalize_url(url)
    begin
      uri = URI.parse(url.to_s.strip)
      uri = URI.parse("http://#{uri}") unless uri.scheme
      uri.scheme = uri.scheme.downcase  # URI should do this
      uri.normalize.to_s
    rescue URI::InvalidURIError
      raise
    end
  end
end

class URI::Generic
  include URI::GenericHacks
end
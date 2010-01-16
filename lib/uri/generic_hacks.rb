module URI::GenericHacks

  # URI.parse("http://four.three.two.one").subdomain => "two.one"
  # URI.parse("http://four.three.two.one").subdomain(3) => "three.two.one"
  def subdomain(level = 2)
    raise ArgumentError unless level > 0
    parts = host.split "."
    parts.shift while parts.length > level
    parts.join "."
  end

end

class URI::Generic
  include URI::GenericHacks
end
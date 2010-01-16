require 'runit/testcase'
require 'runit/cui/testrunner'
require 'runit/testsuite'
require 'tld'

class Testing_class < RUNIT::TestCase

  @@country =
  {
    'aq' => 'Antarctica',
    'at' => 'Austria',
    'au' => 'Australia',
    'bi' => 'Burundi',
    'bv' => 'Bouvet Island',
    'cx' => 'Christmas Island',
    'da' => nil,
    'fl' => nil,
    'gb' => 'United Kingdom (of Great Britain and Northern Ireland)',
    'hr' => 'Croatia',
    'mo' => 'Macau',
    'om' => 'Oman',
    'oy' => nil,
    'sd' => 'Sudan',
    'tm' => 'Turkmenistan',
    'tn' => 'Tunisia',
    'tt' => 'Trinidad and Tobago',
    'uq' => nil,
    've' => 'Venezuela',
    'vi' => 'Virgin Islands, U.S.',
    'we' => nil,
    'xl' => nil,
    'xp' => nil
  }

  @@noncountry_old =
  {
    'gov' => 'Government',
    'net' => 'Network',
    'org' => 'Non-Profit Organization'
  }

  @@noncountry_new =
  {
    'aero' => 'Air Transport Industry',
    'coop' => 'Non-profit cooperatives',
    'name' => 'Individuals'
  }

  @@misc =
  {
    'example'   => 'Documentation or examples',
    'invalid'   => 'Domain names that are surely and obviously invalid',
    'localhost' => 'Loop back IP address',
    'test'      => 'Testing of DNS related code'
  }

  def test_country
    @@country.each { |key, value|
      assert_equal(value, TLD::Country[key])
      assert_equal(value, TLD::All[key])

      assert_nil(TLD::Noncountry_old[key])
      assert_nil(TLD::Noncountry_new[key])
      assert_nil(TLD::Noncountry[key])
      assert_nil(TLD::RFC_2606[key])
      assert_nil(TLD::BCP_32[key])

      if value.nil?
        assert(!TLD.country?(key))
        assert(!TLD.valid?(key))
      else
        assert(TLD.country?(key))
        assert(TLD.valid?(key))
      end

      assert(!TLD.noncountry_old?(key))
      assert(!TLD.noncountry_new?(key))
      assert(!TLD.noncountry?(key))
      assert(!TLD.rfc_2606?(key))
      assert(!TLD.bcp_32?(key))
    }
  end

  def test_noncountry_old
    @@noncountry_old.each { |key, value|
      assert_equal(value, TLD::Noncountry_old[key])
      assert_equal(value, TLD::Noncountry[key])
      assert_equal(value, TLD::All[key])

      assert_nil(TLD::Noncountry_new[key])
      assert_nil(TLD::Country[key])
      assert_nil(TLD::RFC_2606[key])
      assert_nil(TLD::BCP_32[key])

      assert(TLD.noncountry_old?(key))
      assert(TLD.noncountry?(key))
      assert(TLD.valid?(key))

      assert(!TLD.country?(key))
      assert(!TLD.noncountry_new?(key))
      assert(!TLD.rfc_2606?(key))
      assert(!TLD.bcp_32?(key))
    }
  end

  def test_noncountry_new
    @@noncountry_new.each { |key, value|
      assert_equal(value, TLD::Noncountry_new[key])
      assert_equal(value, TLD::Noncountry[key])
      assert_equal(value, TLD::All[key])

      assert_nil(TLD::Noncountry_old[key])
      assert_nil(TLD::Country[key])
      assert_nil(TLD::RFC_2606[key])
      assert_nil(TLD::BCP_32[key])

      assert(TLD.noncountry_new?(key))
      assert(TLD.noncountry?(key))
      assert(TLD.valid?(key))

      assert(!TLD.country?(key))
      assert(!TLD.noncountry_old?(key))
      assert(!TLD.rfc_2606?(key))
      assert(!TLD.bcp_32?(key))
    }
  end

  def test_misc
    @@misc.each { |key, value|
      assert_equal(value, TLD::RFC_2606[key])
      assert_equal(value, TLD::BCP_32[key])

      assert_nil(TLD::Noncountry_old[key])
      assert_nil(TLD::Noncountry_new[key])
      assert_nil(TLD::Noncountry[key])
      assert_nil(TLD::Country[key])
      assert_nil(TLD::All[key])

      assert(TLD.rfc_2606?(key))
      assert(TLD.bcp_32?(key))

      assert(!TLD.country?(key))
      assert(!TLD.noncountry_new?(key))
      assert(!TLD.noncountry_old?(key))
      assert(!TLD.noncountry?(key))
      assert(!TLD.valid?(key))
    }
  end

end

RUNIT::CUI::TestRunner.run(Testing_class.suite)

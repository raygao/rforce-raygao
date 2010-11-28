require 'rubygems'
require 'rforce-raygao'

class TestRforceRaygao < Test::Unit::TestCase
  def test_good
    assert true
  end

  def test_find_accounts_with_rforce_by_name_and_description
    ##Test case with RForce

    #@@config = YAML.load_file(File.dirname(__FILE__) + '/../../../config/database.yml').symbolize_keys
    #setting = @@config[:"salesforce-default-realm"]
    url = 'https://login.salesforce.com'
    userid = 'Username'
    password = 'Password'
    api_version = 20


    #use key file
    @binding = RForce::Binding.new url + "/services/Soap/u/" + api_version.to_s
    #'https://login.salesforce.com/services/Soap/u/20.0'
    @binding.login userid, (password)

    name = 'company'

    @results = @binding.search :searchString => "find {#{name}} in all fields returning account(id, phone)"
    puts @results.to_s
    assert_not_nil @results
  end
end

require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|

  c.default_facts = {
    :operatingsystem   => 'Ubuntu',
    :lsbmajdistrelease => 14,
  }

end

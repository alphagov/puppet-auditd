require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|

  c.default_facts = {
    :lsbdistcodename        => 'trusty',
    :lsbmajdistrelease      => 14,
    :operatingsystem        => 'Ubuntu',
    :operatingsystemrelease => 'trusty',
    :osfamily               => 'Debian',
  }

end

require 'spec_helper'

describe 'auditd::config' do

  let(:facts) {{
    :concat_basedir => '/var/lib/puppet/concat/',
    :operatingsystemrelease => '14.04,'
  }}

  it { 
    should contain_file('/etc/audit/audit.rules').with(
      :mode  => '0600',
      :owner => 'root',
      :group => 'root'
    )
  }
  
  it { 
    should contain_file('/etc/audit/auditd.conf').with(
      :mode  => '0600',
      :owner => 'root',
      :group => 'root'
    )
  }
  
  it { 
    should contain_file('/etc/audisp/plugins.d/syslog.conf').with(
      :mode  => '0640',
      :owner => 'root',
      :group => 'root'
    )
  }
  
  it { 
    should contain_file('/sbin/audispd').with(
      :mode  => '0750',
      :owner => 'root',
      :group => 'root'
    )
  }
  let(:facts) {{
    :concat_basedir => '/var/lib/puppet/concat/',
    :operatingsystemrelease => '16.04,'
  }}
  it {
    should contain_file('/etc/audit/rules.d/base.rules').with(
      :mode  => '0600',
      :owner => 'root',
      :group => 'root'
    )
  }

end

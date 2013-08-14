require 'spec_helper'

describe 'auditd::package' do
  it { should contain_package('auditd') }
  it { should contain_package('libaudit0') }
  it { should contain_package('audispd-plugins') }
end

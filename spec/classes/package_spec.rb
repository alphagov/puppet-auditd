require 'spec_helper'

describe 'auditd::package' do
  context "ubuntu 12.04" do
  let (:facts) {{ :lsbdistrelease => '12.04' }}
  it { should contain_package('auditd') }
  it { should contain_package('libaudit0') }
  it { should contain_package('audispd-plugins') }
  end
  context "ubuntu 14.04" do
  let (:facts) {{ :lsbdistrelease => '14.04' }}
  it { should contain_package('auditd') }
  it { should contain_package('libaudit1') }
  it { should contain_package('audispd-plugins') }
  end
end

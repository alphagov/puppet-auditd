require 'spec_helper'

describe 'auditd::package' do
  context "default" do
    let (:facts) {{ :lsbdistcodename => 'saucy' }}
    it { should contain_package('auditd') }
    it { should contain_package('libaudit1') }
    it { should contain_package('audispd-plugins') }
  end
  context "ubuntu lucid" do
    let (:facts) {{ :lsbdistcodename => 'lucid' }}
    it { should contain_package('auditd') }
    it { should contain_package('libaudit0') }
    it { should contain_package('audispd-plugins') }
  end
  context "ubuntu precise" do
    let (:facts) {{ :lsbdistcodename => 'precise' }}
    it { should contain_package('auditd') }
    it { should contain_package('libaudit0') }
    it { should contain_package('audispd-plugins') }
  end
  context "ubuntu trusty" do
    let (:facts) {{ :lsbdistcodename => 'trusty' }}
    it { should contain_package('auditd') }
    it { should contain_package('libaudit1') }
    it { should contain_package('audispd-plugins') }
  end
end

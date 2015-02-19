require 'spec_helper'

describe 'auditd::package' do
  context "default" do
    let (:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
    }}
    it { should raise_error(Puppet::Error, /Nexenta not supported/) }
  end

  context "ubuntu lucid" do
    let (:facts) {{
        :osfamily => 'debian',
        :lsbdistcodename => 'lucid',
    }}
    it { should contain_package('auditd') }
    it { should contain_package('audispd-plugins') }
  end
  context "ubuntu precise" do
    let (:facts) {{
        :osfamily => 'debian',
        :lsbdistcodename => 'precise',
    }}
    it { should contain_package('auditd') }
    it { should contain_package('audispd-plugins') }
  end
  context "ubuntu trusty" do
    let (:facts) {{
        :osfamily => 'debian',
        :lsbdistcodename => 'trusty',
    }}
    it { should contain_package('auditd') }
    it { should contain_package('audispd-plugins') }
  end

  context "debian wheezy" do
    let (:facts) {{
        :osfamily => 'debian',
        :lsbdistcodename => 'wheezy',
    }}
    it { should contain_package('auditd') }
    it { should contain_package('audispd-plugins') }
  end
  context "debian jessie" do
    let (:facts) {{
        :osfamily => 'debian',
        :lsbdistcodename => 'jessie',
    }}
    it { should contain_package('auditd') }
    it { should contain_package('audispd-plugins') }
  end

  context "redhat rhel" do
    let (:facts) {{
        :osfamily => 'redhat',
    }}
    it { should contain_package('audit') }
    it { should contain_package('audispd-plugins') }
  end
end

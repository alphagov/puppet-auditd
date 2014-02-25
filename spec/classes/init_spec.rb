require 'spec_helper'

describe 'auditd' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "auditd class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
          :concat_basedir => '/var/lib/puppet/concat',
        }}

        it { should contain_class('auditd::package') }
        it { should contain_class('auditd::config') }
        it { should contain_class('auditd::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'auditd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
        :concat_basedir  => '/var/lib/puppet/concat',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end

require 'spec_helper_acceptance'

describe 'auditd module' do
  describe 'example from README' do
    it 'should run with no errors' do
      pp = <<-EOS
        include auditd

        auditd::rule { 'use-of-auditctl':
          content => '-w /sbin/auditctl -p x -k audittools',
          order   => '66',
        }
      EOS

      apply_manifest(pp, :catch_failures => true)
    end

    it 'should have added the audit rule' do
      shell('auditctl -l') do |r|
        expect(r.stdout).to match( /^LIST_RULES: exit,always watch=\/sbin\/auditctl perm=x key=audittools$/ )
      end
    end

    describe service('auditd') do
      it { should be_running }
    end
  end
end


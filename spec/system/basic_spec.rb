require 'spec_helper_system'

describe 'basic tests' do
  it 'class should work without errors and be idempotent' do
    pp = <<-EOS
      class { 'auditd': }
    EOS

    puppet_apply(pp) do |r|
      r.exit_code.should == 2
      r.refresh
      r.exit_code.should be_zero
    end
  end
end

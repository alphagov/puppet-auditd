require 'spec_helper'

describe 'auditd::service' do
  it { should contain_service('auditd') }
end


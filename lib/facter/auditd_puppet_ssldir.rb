
Facter.add('auditd_puppet_ssldir') do
  setcode do
    Puppet[:ssldir]
  end
end

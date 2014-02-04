# == Class: auditd
#
# Sets up auditd with a set of rules.
#
class auditd (
  $immutable = true,
) {

  if ($::osfamily != 'Debian') {
    fail("${::operatingsystem} not supported")
  }

  anchor { 'auditd::begin': } ->
  class { 'auditd::package': } ->
  class { 'auditd::config':
    immutable => $immutable,
  }
  class { 'auditd::service': } ->
  anchor { 'auditd::end': }

  Anchor['auditd::begin']  ~> Class['auditd::service']
  Class['auditd::package'] ~> Class['auditd::service']
  Class['auditd::config']  ~> Class['auditd::service']
}

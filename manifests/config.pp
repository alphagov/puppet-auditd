# == Class: auditd::config
#
#  This class shouldn't be called directly
#
class auditd::config(
  $immutable = undef,
  $halt      = undef,
) {

  if $halt {
    $failure_mode = 2
  } else {
    $failure_mode = 1
  }

  file { '/etc/audit/audit.rules':
    ensure  => file,
    content => template('auditd/audit.rules.erb'),
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }
  file { '/etc/audit/auditd.conf':
    ensure  => file,
    source  => 'puppet:///modules/auditd/etc/audit/auditd.conf',
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }
  file { '/etc/audisp/plugins.d/syslog.conf':
    ensure  => file,
    source  => 'puppet:///modules/auditd/etc/audisp/plugins.d/syslog.conf',
    mode    => '0640',
    owner   => 'root',
    group   => 'root',
  }
  file { '/sbin/audispd':
    mode  => '0750',
    owner => 'root',
    group => 'root',
  }
}

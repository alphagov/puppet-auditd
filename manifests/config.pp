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

  $rules_file = '/etc/audit/audit.rules'

  concat { $rules_file:
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }

  concat::fragment{ 'auditd_rules_begin':
    target  => $rules_file,
    content => template('auditd/audit.rules.begin.fragment.erb'),
    order   => '01'
  }

  if $immutable {
    concat::fragment{ 'auditd_rules_end':
      target  => $rules_file,
      content => "\n## Make the configuration immutable\n-e 2",
      order   => '99'
    }
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

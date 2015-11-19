# == Class: auditd::config
#
#  This class shouldn't be called directly
#
class auditd::config(
  $immutable               = undef,
  $halt                    = undef,
  $log_file                = '/var/log/audit/audit.log',
  $log_format              = 'RAW',
  $log_group               = 'root',
  $priority_boost          = '4',
  $flush                   = 'INCREMENTAL',
  $freq                    = '20',
  $num_logs                = '4',
  $disp_qos                = 'lossy',
  $dispatcher              = '/sbin/audispd',
  $name_format             = 'NONE',
  $max_log_file            = '5 ',
  $max_log_file_action     = 'ROTATE',
  $space_left              = '75',
  $space_left_action       = 'SYSLOG',
  $action_mail_acct        = 'root',
  $admin_space_left        = '50',
  $admin_space_left_action = 'SUSPEND',
  $disk_full_action        = 'SUSPEND',
  $disk_error_action       = 'SUSPEND',
  $tcp_listen_queue        = '5',
  $tcp_client_max_idle     = '0',
  $enable_krb5             = 'no',
  $krb5_principal          = 'auditd',
) {

  if $halt {
    $failure_mode = 2
  } else {
    $failure_mode = 1
  }

  $rules_file = '/etc/audit/audit.rules'

  concat { $rules_file:
    mode  => '0600',
    owner => 'root',
    group => 'root',
  }

  if $::operatingsystem == 'Ubuntu' and
      versioncmp($::operatingsystemrelease, '14.04') >= 0 {
    $interfieldcomp = true
  } elsif ($::operatingsystem == 'RedHat' or $::operatingsystem == 'Centos') and
          versioncmp($::operatingsystemrelease, '6.3') >= 0 {
    $interfieldcomp = true
  } else {
    $interfieldcomp = false
  }

  concat::fragment{ 'auditd_rules_begin':
    target  => $rules_file,
    content => template('auditd/audit.rules.begin.fragment.erb'),
    order   => '01'
  }

  concat::fragment{ 'auditd_rules_end':
    target  => $rules_file,
    content => template('auditd/audit.rules.end.fragment.erb'),
    order   => '99'
  }

  file { '/etc/audit/auditd.conf':
    ensure  => file,
    content => template('auditd/auditd.conf.erb'),
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
  }
  file { '/etc/audisp/plugins.d/syslog.conf':
    ensure => file,
    source => 'puppet:///modules/auditd/etc/audisp/plugins.d/syslog.conf',
    mode   => '0640',
    owner  => 'root',
    group  => 'root',
  }
  file { '/sbin/audispd':
    mode  => '0750',
    owner => 'root',
    group => 'root',
  }
}

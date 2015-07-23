# == Class: auditd::config
#
#  This class shouldn't be called directly
#
class auditd::config (
  $rules_file              = $::auditd::rules_file,
  $immutable               = $::auditd::immutable,
  $failure_mode            = $::auditd::failure_mode,
  $log_file                = $::auditd::log_file,
  $log_format              = $::auditd::log_format,
  $log_group               = $::auditd::log_group,
  $priority_boost          = $::auditd::priority_boost,
  $flush                   = $::auditd::flush,
  $freq                    = $::auditd::freq,
  $num_logs                = $::auditd::num_logs,
  $disp_qos                = $::auditd::disp_qos,
  $dispatcher              = $::auditd::dispatcher,
  $name_format             = $::auditd::name_format,
  $max_log_file            = $::auditd::max_log_file,
  $max_log_file_action     = $::auditd::max_log_file_action,
  $space_left              = $::auditd::space_left,
  $space_left_action       = $::auditd::space_left_action,
  $action_mail_acct        = $::auditd::action_mail_acct,
  $admin_space_left        = $::auditd::admin_space_left,
  $admin_space_left_action = $::auditd::admin_space_left_action,
  $disk_full_action        = $::auditd::disk_full_action,
  $disk_error_action       = $::auditd::disk_error_action,
  $tcp_listen_queue        = $::auditd::tcp_listen_queue,
  $tcp_client_max_idle     = $::auditd::tcp_client_max_idle,
  $enable_krb5             = $::auditd::enable_krb5,
  $krb5_principal          = $::auditd::krb5_principal,
) inherits auditd {

  concat { $rules_file:
    mode  => '0600',
    owner => 'root',
    group => 'root',
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

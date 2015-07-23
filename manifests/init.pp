# == Class: auditd
#
# Sets up auditd with a set of rules.
#
class auditd (
  $rules_file              = $::auditd::params::rules_file,
  $immutable               = $::auditd::params::immutable,
  $failure_mode            = $::auditd::params::failure_mode,
  $log_file                = $::auditd::params::log_file,
  $log_format              = $::auditd::params::log_format,
  $log_group               = $::auditd::params::log_group,
  $priority_boost          = $::auditd::params::priority_boost,
  $flush                   = $::auditd::params::flush,
  $freq                    = $::auditd::params::freq,
  $num_logs                = $::auditd::params::num_logs,
  $disp_qos                = $::auditd::params::disp_qos,
  $dispatcher              = $::auditd::params::dispatcher,
  $name_format             = $::auditd::params::name_format,
  $max_log_file            = $::auditd::params::max_log_file,
  $max_log_file_action     = $::auditd::params::max_log_file_action,
  $space_left              = $::auditd::params::space_left,
  $space_left_action       = $::auditd::params::space_left_action,
  $action_mail_acct        = $::auditd::params::action_mail_acct,
  $admin_space_left        = $::auditd::params::admin_space_left,
  $admin_space_left_action = $::auditd::params::admin_space_left_action,
  $disk_full_action        = $::auditd::params::disk_full_action,
  $disk_error_action       = $::auditd::params::disk_error_action,
  $tcp_listen_queue        = $::auditd::params::tcp_listen_queue,
  $tcp_client_max_idle     = $::auditd::params::tcp_client_max_idle,
  $enable_krb5             = $::auditd::params::enable_krb5,
  $krb5_principal          = $::auditd::params::krb5_principal,
  $service_name            = $::auditd::params::service_name,
  $service_ensure          = $::auditd::params::service_ensure,
  $service_enable          = $::auditd::params::service_enable,
  $service_hasrestart      = $::auditd::params::service_hasrestart,
  $service_hasstatus       = $::auditd::params::service_hasstatus,
  $service_restart_command = $::auditd::params::service_restart_command,
) inherits auditd::params {

  anchor { 'auditd::begin': } ->
  class { 'auditd::package': } ->
  class { 'auditd::config': }
  class { 'auditd::service': } ->
  anchor { 'auditd::end': }

  Anchor['auditd::begin']  ~> Class['auditd::service']
  Class['auditd::package'] ~> Class['auditd::service']
  Class['auditd::config']  ~> Class['auditd::service']
}

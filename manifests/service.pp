# == Class: auditd::service
#
#  This class shouldn't be called directly
#
class auditd::service (
  $service_name            = $::auditd::service_name,
  $service_ensure          = $::auditd::service_ensure,
  $service_enable          = $::auditd::service_enable,
  $service_hasrestart      = $::auditd::service_hasrestart,
  $service_hasstatus       = $::auditd::service_hasstatus,
  $service_restart_command = $::auditd::service_restart_command,
) inherits auditd {
  service { $service_name:
    ensure     => $service_ensure,
    enable     => $service_enable,
    hasstatus  => $service_hasstatus,
    hasrestart => $service_hasrestart,
    restart    => $service_restart_command,
  }
}

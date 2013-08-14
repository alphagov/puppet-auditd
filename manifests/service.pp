class auditd::service {
  service { 'auditd':
    ensure  => running,
  }
}

define auditd::rule($content="", $order=10) {
  if $content == "" {
    $body = $name
  } else {
    $body = $content
  }

  concat::fragment{ "auditd_fragment_$name":
    target  => $auditd::config::rules_file,
    content => $body
  }
}

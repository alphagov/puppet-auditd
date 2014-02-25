# Defined type for an audit rule fragment
#
#  params:
#    - content: The file source
#    - order:   Relative order of this fragment
define auditd::rule($content='', $order=10) {
  if $content == '' {
    $body = $name
  } else {
    $body = $content
  }

  concat::fragment{ "auditd_fragment_${name}":
    target  => $auditd::config::rules_file,
    order   => $order,
    content => $body,
  }
}

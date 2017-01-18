# Class: auditd::rules
#
# This class enables support for a full hiera based auditders configuration.
# Hiera functionality is auto enabled during the initial auditd module load;
# this class is not intended to be loaded directly.
#
# See the primary auditd module documentation for usage and examples.

class auditd::rules {
    # NOTE: hiera_hash does not work as expected in a parameterized class
    # definition; so we call it here.
    #
    # http://docs.puppetlabs.com/hiera/1/puppet.html#limitations
    # https://tickets.puppetlabs.com/browse/HI-118

    $rules = hiera_hash('auditd::rules', undef)

    if $rules {
        create_resources('::auditd::rule', $rules)
    }
}

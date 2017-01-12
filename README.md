## Security Notice

Versions prior to 0.3.1 contained a serious bug which could cause audit 
rules to be silently ignored. Please see [this advisory](https://groups.google.com/a/digital.cabinet-office.gov.uk/forum/?hl=en-GB#!topic/gds-operations-open-source/OsCPf6FDjyY).

# auditd

This module installs and configures auditd. It also provides a defined type(`auditd::rule`) to set up auditd rules.

## Example usage

Include with default parameters and add a rule:
```
include auditd
auditd::rule { 'use-of-auditctl':
  content => '-w /sbin/auditctl -p x -k audittools',
  order   => '66',
}
```

## License

See [LICENSE](LICENSE) file.

## Development

We encourage contributors to run tests locally and to add tests for new
functionality before submitting changes. 

To do this you'll need to have the following things installed:

 * [ruby](https://www.ruby-lang.org/en/)
 * [bundler](http://bundler.io/)

To run the beaker acceptance tests, you need the above things, plus:

 * [vagrant](https://www.vagrantup.com/)
 * [virtualbox](https://www.virtualbox.org/)

Once you have those things installed, you should run this command to install
other ruby dependencies needed to test the module.

     bundle install

### Running tests

At a minimum, run the puppet syntax checks, lint checks and rspec-puppet
compile-time tests:

    bundle exec rake test

In addition, the beaker acceptance tests actually run the puppet code on Ubuntu
12.04 and 14.04 vagrant virtual machines and check that it worked. To run them:

    bundle exec rake beaker

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

## Example hiera usage

### Default parameters:
```
classes:
  - 'auditd'
```
### Specific rule file

```
auditd::rules:
  'rule01':
    source: 'puppet:///modules/example/auditd/pci.rules'
    order: '20'
```
### Specific rule content
```
auditd::rules:
  'rule02':
    content: "examplecontent\n"
    order: '21'
```
### Combinations are also possible
```
auditd::rules:
  'rule01':
    source: 'puppet:///modules/example/auditd/pci.rules'
    order: '20'
  'rule02':
    content: "examplecontent\n"
    order: '21'
```

## License

See [LICENSE](LICENSE) file.

#Install a package
package { 'flask':
  ensure => 'installed',
  source => 'pip3',
}

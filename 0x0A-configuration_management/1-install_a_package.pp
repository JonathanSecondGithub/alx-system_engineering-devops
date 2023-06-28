#Install a package
package { 'Flask':
  ensure   => 'installed',
  provider => 'pip3',
}

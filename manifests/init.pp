# Class: dwm
# ===========================
#
# Compile and install the dwm window manager.
#
# Parameters
# ----------
#
# * `version`
# Specifies the version of `dwm` to be compiled.
# This is used by git to check out the desired
# reference prior to compilation. So, this value
# can be any valid git reference
# (e.g. tag, SHA, branch).
#
# Default: '6.0'
#
# * `prefix`
# The root location for the build artifacts to
# be installed.
#
# Default: '/usr/local'
#
# * `source_root`
# The root location for the dwm git repo to
# cloned into.
#
# Default: '/opt/puppet_staging/sources'
#
# * `git_manage`
# Should the module install git for you?
#
# Default: true
#
# * `dev_packages`
# List of required packages to perform compilation.
#
# Default: $dwm::params::dev_packages
#
#
# Examples
# --------
#
# @example
#    class { 'dwm':
#      version => '5.8.2',
#      prefix  => '/opt/mysoftware',
#    }
#
# Authors
# -------
#
# John Duarte <john@yeliad.us>
#
# Copyright
# ---------
#
# Copyright 2015 John Duarte, unless otherwise noted.
#
class dwm (
  $version = '6.0',
  $prefix = '/usr/local',
  $source_root = '/opt/puppet_staging/sources',
  $git_manage = true,
  $dev_packages = $dwm::params::dev_packages,
) inherits dwm::params {

  class { 'git': package_manage => $git_manage, }
  contain 'git'
  ensure_packages($dev_packages)

  # Pull down repo for dwm
  vcsrepo { 'dwm':
    ensure   => 'present',
    path     => "${source_root}/dwm",
    provider => 'git',
    source   => 'git://suckless.org/dwm',
    revision => $version,
    require  =>  Class['git'],
  }

  file { "${prefix}/share/dwm":
    ensure => absent,
    force  => true,
    before => Exec['install dwm'],
  }

  exec { 'install dwm':
    cwd         => "${source_root}/dwm",
    command     => '/usr/bin/make clean install',
    environment => "PREFIX=${prefix}",
    creates     => "${prefix}/bin/dwm",
    subscribe   => Vcsrepo['dwm'],
  }
}

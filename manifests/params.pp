#
class dwm::params {
  case $::osfamily {
    'Debian': {
      $dev_packages = [
          'libx11-dev', 'libxft-dev', 'libxinerama-dev',
          'gcc', 'g++', 'make'
        ]
    }
    default: {
      $dev_packages = [ ]
    }
  }
}

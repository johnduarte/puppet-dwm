# dwm

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with dwm](#setup)
    * [What dwm affects](#what-dwm-affects)
    * [Beginning with dwm](#beginning-with-dwm)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Module to install the dwm window manager.

## Module Description

This module compiles and installs the dwm window manageer
on a target node.

## Setup

### What dwm affects

* `dwm` executable at defined location.

### Beginning with dwm

```puppet
include dwm
```

## Usage

### I just want `dwm` installed

```puppet
include dwm
```

### I want to specify the version and location of `dwm`

```puppet
class { 'dwm':
  version => '5.8.2',
  prefix => '/opt/mysoftware',
}
```

## Reference

### Classes

* `dwm`: Installs the dwm binary

## Limitations

This module is known to work with the following operating system families:

 - Debian 8.2.0 or newer

The ability to customize the `config.h` file is not supported. This
is left up to the user to update the `config.h` file and recompile
`dwm` as desired.

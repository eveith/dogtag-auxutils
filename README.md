# Notify users of expiring certificates

## About

This simple perl script reads the list of currently active certificates from a
Dogtag PKI instance and notifies all those certificate holders whose
certificates are about to expire per e-mail.

## Prerequisites

A number of CPAN modules are needed for this script. Those are:

  - `DateTime`
  - `XML::Twig`
  - `HTTP::Tiny`
  - `Email::Send`
  - `DateTime::Format::Mail`

## Usage

Copy the script to any location where it can be executed. Then, invoke
`notify-expiring-certificates -h` to get a help output. 

    notifiy-expiring-certs - A simple e-mail notifier for expiring certificates.

    Options:

    -uURI        PKI server URI (DEFAULT: https://localhost:8443)
    -mSERVER     Mail server (DEFAULT: localhost)
    -fFROM       Mail from address (DEFAULT: certmaster@YOURDOMAIN)
    -tTO         Fall-back recepient (DEFAULT: certmaster@YOURDOMAIN)
    -dDAYS       Warning period, in days (DEFAULT: 60)
    -h           This help message

This script should usually be run from cron, e.g., by placing a symlink into
`/etc/cron.daily`, or at a similar location.

## License

Copyright 2016  Eric MSP Veith <eveith@veith-m.de>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

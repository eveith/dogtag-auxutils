# Dogtag PKI standalone utility scripts

## About

These are two simple perl scripts that automate a part of the certificate
handling with a Dogtag PKI.

The repository contains `notify-expering-certificates`, which reads the list
of currently active certificates from a Dogtag PKI instance and notifies all
those certificate holders whose certificates are about to expire per e-mail.
`renew-certificates` automatically renews certificates that are close to
expiration.

## Prerequisites

A number of CPAN modules are needed for the scripts. Those are:

  - `DateTime`
  - `XML::Twig`
  - `HTTP::Tiny`
  - `Email::Send`
  - `Net::SSLeay`
  - `IO::Socket::SSL`
  - `Text::ParseWords`
  - `DateTime::Format::Mail`
  - `DateTime::Format::DateParse`

## Usage

### Notify-expering-certificates

Copy the script to any location where any user can execute it. Then issue
`notify-expiring-certificates -h` to get a help output:

    notifiy-expiring-certs - A simple e-mail notifier for expiring certificates.

    Options:

    -uURI        PKI server URI (DEFAULT: https://localhost:8443)
    -mSERVER     Mail server (DEFAULT: localhost)
    -fFROM       Mail from address (DEFAULT: certmaster@YOURDOMAIN)
    -tTO         Fall-back recepient (DEFAULT: certmaster@YOURDOMAIN)
    -dDAYS       Warning period, in days (DEFAULT: 60)
    -h           This help message

This script should usually be run from cron, e.g., by placing a symlink into
`/etc/cron.daily`, or at a similar location. It does not need to reside on the
PKI server, but can be run from any server that is allowed to access the
Dogtag PKI REST entpoint.

### Renew-certificates

Copy the script to a location where it can be run by the user(s) whose
certificates you intend to renew. The script must have write access to the
certificate files, and read access to the corresponding key files. Then run
`renew-certificates -h` for the following help output:

    renew-certificates - A simple Dogtag PKI certificate autorenewer

    Options:

    -uURI        PKI server URI (DEFAULT: https://localhost:8443)
    -iFILE       File containing certificates and key locations;
    reads from STDIN if FILE is `-' (DEFAULT: STDIN)
    -dDAYS       Minimum number of days that triggers renewal (DEFAULT: 30)
    -h           This help message

    Input file format:

    The input file contains one entry per line, consisting of two columns
    The first column indicates the path to the certificate,
    the second column the path to the private key corresponding to the 
    certificate.
    Both files must be readable and PEM-encoded. The columns are separated by a
    space character (\s+). A backslash (\) escapes the following space.
    Columns starting with a hash sign (#) are treated as comments.

The script must reside on the server where the certificate and key files are
located, because it writes the new certificate into the PEM file when it
successfully obtained a renewed certificate. The machine needs HTTPS access to
the Dogtag PKI REST API endpoint.

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

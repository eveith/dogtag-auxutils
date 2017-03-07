#
# spec file for package dogtag-auxutils
#
# Copyright (c) 2017 SUSE LINUX GmbH, Nuernberg, Germany.
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via http://bugs.opensuse.org/
#


Name:           dogtag-auxutils
Version:        1.0
Release:        0
Summary:        Auxiliary automation tools for a Dogtag PKI
License:        Apache-2.0
Group:          Productivity/Networking/Security
Url:            https://github.com/eveith/dogtag-auxutils
Source0:        dogtag-auxutils-%{version}.tar.gz
BuildRequires:  make, perl
Requires:       perl
Requires:       perl-XML-Twig
Requires:       perl-HTTP-Tiny
Requires:       perl-Email-Send
Requires:       perl-Net-SSLeay
Requires:       perl-IO-Socket-SSL
Requires:       perl-DateTime-Format-Mail
Requires:       perl-DateTime-Format-DateParse
BuildRoot:      %{_tmppath}/%{name}-%{version}-build
BuildArch:      noarch

%description
These are two simple perl scripts that automate a part of the certificate
handling with a Dogtag PKI.

The repository contains notify-expering-certificates, which reads the list of
currently active certificates from a Dogtag PKI instance and notifies all
those certificate holders whose certificates are about to expire per e-mail.
renew-certificates automatically renews certificates that are close to
expiration.


%prep
%setup -q


%build
make %{?_smp_mflags}


%install
make DESTDIR=%{buildroot} install



%files
%defattr(-,root,root)
%doc README.md LICENSE TODO
%{_sbindir}/renew-certificates
%{_bindir}/notify-expiring-certificates
%doc %{_mandir}/man8/renew-certificates.8*
%doc %{_mandir}/man1/notify-expiring-certificates.1*

%changelog

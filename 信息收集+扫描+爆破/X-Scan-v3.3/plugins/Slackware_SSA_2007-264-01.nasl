# This script was automatically generated from the SSA-2007-264-01
# Slackware Security Advisory
# It is released under the Nessus Script Licence.
# Slackware Security Advisories are copyright 1999-2009 Slackware Linux, Inc.
# SSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.
# See http://www.slackware.com/about/ or http://www.slackware.com/security/
# Slackware(R) is a registered trademark of Slackware Linux, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(26113);
script_version("$Revision: 1.3 $");
script_category(ACT_GATHER_INFO);
script_family(english: "Slackware Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_copyright("This script is Copyright (C) 2009 Tenable Network Security, Inc.");
script_require_keys("Host/Slackware/release", "Host/Slackware/packages");

script_set_attribute(attribute:'synopsis', value:
'The remote host is missing the SSA-2007-264-01 security update');
script_set_attribute(attribute:'description', value: '
New kdebase packages are available for Slackware 12.0 to fix security issues.

A long URL padded with spaces could be used to display a false URL in
Konqueror\'s addressbar, and KDM when used with no-password login could
be tricked into logging a different user in without a password.  This
is not the way KDM is configured in Slackware by default, somewhat
mitigating the impact of this issue.

More details about the issues may be found here:

    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-3820
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4224
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4225
    http://www.kde.org/info/security/advisory-20070919-1.txt
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4569
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-4225


');
script_set_attribute(attribute:'solution', value: 
'Update the packages that are referenced in the security advisory.');
script_xref(name: "SSA", value: "2007-264-01");
script_summary("SSA-2007-264-01 kdebase, kdelibs ");
script_name(english: "SSA-2007-264-01 kdebase, kdelibs ");
script_cve_id("CVE-2007-3820","CVE-2007-4224","CVE-2007-4225","CVE-2007-4569");
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P');
script_end_attributes();
exit(0);
}

include('slackware.inc');
include('global_settings.inc');

if ( ! get_kb_item('Host/Slackware/packages') ) exit(1, 'Could not obtain the list of packages');

extrarep = NULL;
if (slackware_check(osver: "12.0", pkgname: "kdebase", pkgver: "3.5.7", pkgnum:  "3", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) extrarep = strcat(extrarep, '
The package kdebase is vulnerable in Slackware 12.0
Upgrade to kdebase-3.5.7-i486-3_slack12.0 or newer.
');
}
if (slackware_check(osver: "12.0", pkgname: "kdelibs", pkgver: "3.5.7", pkgnum:  "3", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) extrarep = strcat(extrarep, '
The package kdelibs is vulnerable in Slackware 12.0
Upgrade to kdelibs-3.5.7-i486-3_slack12.0 or newer.
');
}

if (w) { security_warning(port: 0, extra: extrarep); }

else exit(0, "Host is not affected");

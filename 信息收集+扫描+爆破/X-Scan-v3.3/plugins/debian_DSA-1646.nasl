# This script was automatically generated from the dsa-1646
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(34354);
 script_version("$Revision: 1.3 $");
 script_xref(name: "DSA", value: "1646");
 script_cve_id("CVE-2008-1612");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1646 security update');
 script_set_attribute(attribute: 'description', value:
'A weakness has been discovered in squid, a caching proxy server.  The
flaw was introduced upstream in response to CVE-2007-6239, and
announced by Debian in DSA-1482-1.  The flaw involves an
over-aggressive bounds check on an array resize, and could be
exploited by an authorized client to induce a denial of service
condition against squid.
For the stable distribution (etch), these problems have been fixed in
version 2.6.5-6etch2.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1646');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your squid packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1646] DSA-1646-1 squid");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1646-1 squid");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'squid', release: '4.0', reference: '2.6.5-6etch2');
deb_check(prefix: 'squid-cgi', release: '4.0', reference: '2.6.5-6etch2');
deb_check(prefix: 'squid-common', release: '4.0', reference: '2.6.5-6etch2');
deb_check(prefix: 'squidclient', release: '4.0', reference: '2.6.5-6etch2');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");

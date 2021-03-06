# This script was automatically generated from the dsa-523
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15360);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "523");
 script_cve_id("CVE-2004-0455");
 script_bugtraq_id(10577);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-523 security update');
 script_set_attribute(attribute: 'description', value:
'Ulf Härnhammar discovered a buffer overflow vulnerability in www-sql,
a CGI program which enables the creation of dynamic web pages by
embedding SQL statements in HTML.  By exploiting this
vulnerability, a local user could cause the execution of arbitrary
code by creating a web page and processing it with www-sql.
For the current stable distribution (woody), this problem has been
fixed in version 0.5.7-17woody1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2004/dsa-523');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2004/dsa-523
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA523] DSA-523-1 www-sql");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-523-1 www-sql");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'www-mysql', release: '3.0', reference: '0.5.7-17woody1');
deb_check(prefix: 'www-pgsql', release: '3.0', reference: '0.5.7-17woody1');
deb_check(prefix: 'www-sql', release: '3.0', reference: '0.5.7-17woody1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");

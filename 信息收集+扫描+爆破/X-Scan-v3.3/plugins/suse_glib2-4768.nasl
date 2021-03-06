
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(29244);
 script_version ("$Revision: 1.4 $");
 script_name(english: "SuSE Security Update:  glib2 security update (glib2-4768)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch glib2-4768");
 script_set_attribute(attribute: "description", value: "Glib2 contains a copy of the pcre library. Specially
crafted regular expressions could lead to a buffer overflow
in the pcre library. Applications using pcre to process
regular expressions from untrusted sources could therefore
potentially be exploited by attackers to execute arbitrary
code (CVE-2007-1659, CVE-2007-1660). This update makes
glib2 use the system's pcre library which was already
updated to fix the above mentioned problems.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Install the security patch glib2-4768");
script_end_attributes();

script_cve_id("CVE-2007-1659", "CVE-2007-1660");
script_summary(english: "Check for the glib2-4768 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"glib2-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"glib2-32bit-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"glib2-64bit-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"glib2-devel-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"glib2-devel-64bit-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
if ( rpm_check( reference:"glib2-doc-2.14.1-4.2", release:"SUSE10.3") )
{
	security_warning(port:0, extra:rpm_report_get());
	exit(0);
}
exit(0,"Host is not affected");

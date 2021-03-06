
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41228);
 script_version("$Revision: 1.4 $");
 script_name(english: "SuSE9 Security Update:  Security update for Ruby (12214)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE9 system is missing the security patch 12214");
 script_set_attribute(attribute: "description", value: 'This update of ruby fixes: 
a possible information leakage (CVE-2008-1145) 
a directory traversal bug (CVE-2008-1891) in WEBrick 
various memory corruptions and integer overflows in array and string handling (CVE-2008-2662, CVE-2008-2663, CVE-2008-2664, CVE-2008-2725, CVE-2008-2726, CVE-2008-2727, CVE-2008-2728)
');
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:C/I:C/A:C");
script_set_attribute(attribute: "solution", value: "Install the security patch 12214");
script_end_attributes();

 script_cve_id("CVE-2008-1145", "CVE-2008-1891", "CVE-2008-2662", "CVE-2008-2663", "CVE-2008-2664", "CVE-2008-2725", "CVE-2008-2726");
script_summary(english: "Check for the security advisory #12214");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");
if ( rpm_check( reference:"ruby-1.8.1-42.24", release:"SUSE9", cpu: "i586") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");

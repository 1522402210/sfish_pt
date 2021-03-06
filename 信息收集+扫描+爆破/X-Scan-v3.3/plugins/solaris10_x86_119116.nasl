#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(22987);
 script_version("$Revision: 1.24 $");

 script_name(english: "Solaris 10 (x86) : 119116-35");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 119116-35");
 script_set_attribute(attribute: "description", value:
'Mozilla 1.7_x86 patch.
Date this patch was last updated by Sun : Aug/05/09');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-119116-35-1");
 script_set_attribute(attribute: "risk_factor", value: "High");
 script_end_attributes();

 script_summary(english: "Check for patch 119116-35");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmozgm", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmozilla-devel", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmozilla", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmozmail", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmoznspr", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmoznss-devel", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmoznss", version:"1.7,REV=10.0.3.2004.12.21.11.47");
e +=  solaris_check_patch(release:"5.10_x86", arch:"i386", patch:"119116-35", obsoleted_by:"", package:"SUNWmozpsm", version:"1.7,REV=10.0.3.2004.12.21.11.47");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_hole(0);
	else  
	   security_hole(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");

#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);
include("compat.inc");

if(description)
{
 script_id(23521);
 script_version("$Revision: 1.7 $");

 script_name(english: "Solaris 5.9 (sparc) : 116736-25");
 script_set_attribute(attribute: "synopsis", value:
"The remote host is missing Sun Security Patch number 116736-25");
 script_set_attribute(attribute: "description", value:
'PS 6.3: Portal Server.
Date this patch was last updated by Sun : Nov/04/04');
 script_set_attribute(attribute: "solution", value:
"You should install this patch for your system to be up-to-date.");
 script_set_attribute(attribute: "see_also", value:
"http://sunsolve.sun.com/search/document.do?assetkey=1-21-116736-25-1");
 script_set_attribute(attribute: "risk_factor", value: "Medium");
 script_end_attributes();

 script_summary(english: "Check for patch 116736-25");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 family["english"] = "Solaris Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Solaris/showrev");
 exit(0);
}



include("solaris.inc");

e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWiimps", version:"6.2,REV=2003.11.17.14.12");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWps", version:"6.2,REV=2003.11.17.14.07");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsap", version:"6.2,REV=2003.11.17.14.11");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsc", version:"6.2,REV=2003.11.17.13.48");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpscp", version:"6.2,REV=2003.11.17.14.11");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsdis", version:"6.2,REV=2003.11.17.14.09");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsdt", version:"6.2,REV=2003.11.17.13.49");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsdta", version:"6.2,REV=2003.11.17.13.50");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsdtm", version:"6.2,REV=2003.11.17.13.50");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsdtx", version:"6.2,REV=2003.11.17.14.08");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsmp", version:"6.2,REV=2003.11.17.14.11");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsnm", version:"6.2,REV=2003.11.17.14.08");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsoh", version:"6.2,REV=2003.11.17.14.08");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsp", version:"6.2,REV=2003.11.17.13.50");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsps", version:"6.2,REV=2003.11.17.13.50");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsrw", version:"6.2,REV=2003.11.17.13.48");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsrwa", version:"6.2,REV=2003.11.17.13.48");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssdk", version:"6.2,REV=2003.11.17.14.08");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsse", version:"6.2,REV=2003.11.17.14.02");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssea", version:"6.2,REV=2003.11.17.14.02");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssep", version:"6.2,REV=2003.11.17.14.02");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssp", version:"6.2,REV=2003.11.17.14.09");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpsss", version:"6.2,REV=2003.11.17.14.21");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssso", version:"6.2,REV=2003.11.17.14.10");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpssub", version:"6.2,REV=2003.11.17.14.09");
e +=  solaris_check_patch(release:"5.9", arch:"sparc", patch:"116736-25", obsoleted_by:"", package:"SUNWpstlj", version:"6.2,REV=2003.11.17.13.52");
if ( e < 0 ) { 
	if ( NASL_LEVEL < 3000 ) 
	   security_warning(0);
	else  
	   security_warning(port:0, extra:solaris_get_report());
	exit(0); 
} 
exit(0, "Host is not affected");

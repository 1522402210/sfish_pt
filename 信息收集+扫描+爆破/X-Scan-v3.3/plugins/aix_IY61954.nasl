#
# (C) Tenable Network Security
#
#

if ( ! defined_func("bn_random") ) exit(0);

include("compat.inc");

if(description)
{
 script_id(18455);
 script_version ("$Revision: 1.4 $");
 name["english"] = "AIX 5.2 : IY61954";
 
 script_name(english:name["english"]);
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing a vendor-supplied security patch" );
 script_set_attribute(attribute:"description", value:
"The remote host is missing AIX Critical Security Patch number IY61954
(SECURITY VULNERABILITIES IN XPM CODE).

You should install this patch for your system to be up-to-date." );
 script_set_attribute(attribute:"solution", value:
"http://www-912.ibm.com/eserver/support/fixes/" );
 script_set_attribute(attribute:"risk_factor", value:"High" );


 script_end_attributes();

 
 summary["english"] = "Check for patch IY61954"; 
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security");
 family["english"] = "AIX Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/AIX/lslpp");
 exit(0);
}



include("aix.inc");

 if( aix_check_patch(release:"5.2", patch:"IY61954", package:"X11.motif.lib.5.2.0.50") < 0 ) 
   security_hole();

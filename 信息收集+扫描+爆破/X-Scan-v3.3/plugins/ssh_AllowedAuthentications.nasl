#
# (C) Tenable Network Security, Inc.
#


include("compat.inc");

if(description)
{
 script_id(10965);
 script_version ("$Revision: 1.18 $");
 script_cve_id("CVE-2002-1646");
 script_bugtraq_id(4810);
 script_xref(name:"OSVDB", value:"18238");

 script_name(english:"SSH 3 AllowedAuthentications Remote Bypass");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote SSH server may accept password-based authentications even when
not explicitely enabled." );
 script_set_attribute(attribute:"description", value:
"The remote host is running a version of SSH which is older than 3.1.2
and newer or equal to 3.0.0.

There is a vulnerability in this release that may, under some circumstances, 
allow users to authenticate using a password whereas it is not explicitly 
listed as a valid authentication mechanism.

An attacker may use this flaw to attempt to brute force a password using a 
dictionary attack (if the passwords used are weak)." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to version 3.1.2 of SSH which solves this problem." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:S/C:N/I:P/A:N" );

script_end_attributes();

 
 script_summary(english:"Checks for the remote SSH version");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2002-2009 Tenable Network Security, Inc.");
 script_family(english:"Misc.");
 script_dependencie("ssh_detect.nasl");
 script_require_ports("Services/ssh", 22);
 exit(0);
}

#
# The script code starts here
#
include("backport.inc");

port = get_kb_item("Services/ssh");
if(!port)port = 22;

banner = get_kb_item("SSH/banner/" + port);
if ( ! banner ) exit(0);
banner = tolower(get_backport_banner(banner:banner));


if("openssh" >< banner)exit(0);
if("f-secure" >< banner)exit(0);
if("mpSSH" >< banner)exit(0);
if("Sun_SSH" >< banner)exit(0);

if(ereg(pattern:"SSH[-_](3\.(0\.[0-9]+)|(1\.[01])[^0-9]*)$", string:banner))
	security_note(port);

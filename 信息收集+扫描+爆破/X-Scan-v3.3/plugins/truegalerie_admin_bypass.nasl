#
# (C) Tenable Network Security, Inc.
#

include("compat.inc");

if(description)
{
 script_id(11582);
 script_version ("$Revision: 1.12 $");
 script_cve_id("CVE-2003-1488");
 script_bugtraq_id(7427);
 script_xref(name:"OSVDB", value:"53369");

 script_name(english:"Truegalerie admin.php loggedin Parameter Admin Authentication Bypass");

 script_set_attribute(attribute:"synopsis", value:
"The remote host has a PHP script that is affected by an
authentication bypass issue." );
 script_set_attribute(attribute:"description", value:
"The remote host is running TrueGalerie, an album management 
system written in PHP.

There is a flaw in the version of TrueGalerie which may 
allow an attacker to log in as the administrator without 
having to know the password, simply by requesting the URL :

  /admin.php?loggedin=1
		
Provided PHP's 'register_globals' setting is enabled, an 
attacker may use this flaw to gain administrative privileges
on this web server and modify its content." );
 script_set_attribute(attribute:"solution", value:
"Disable the option 'register_globals' in php.ini or replace
this set of CGI by something else." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:P/A:P" );

script_end_attributes();

 
 script_summary(english:"logs into the remote TrueGalerie installation");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2003-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses");
 script_dependencie("find_service1.nasl", "http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

#
# The script code starts here
#

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

if(!can_host_php(port:port))exit(0);

function check(loc)
{
 local_var res, req;
 res = http_send_recv3(method:"GET", item:string(loc, "/admin.php?loggedin=1"), port:port);

 if(isnull(res))exit(1,"Null response to admin.php request.");
 if(">DECONNEXION</a>" >< res[2] &&
    "Liste des catégories" >< res[2])
 {
 	security_warning(port);
	exit(0);
 }
}

foreach dir (cgi_dirs())
{
 check(loc:dir);
}

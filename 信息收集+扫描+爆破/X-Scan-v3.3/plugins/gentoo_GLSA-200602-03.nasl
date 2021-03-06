# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200602-03.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2006 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description)
{
 script_id(20874);
 script_version("$Revision: 1.4 $");
 script_xref(name: "GLSA", value: "200602-03");
 script_cve_id("CVE-2005-3352", "CVE-2005-3357");

 script_set_attribute(attribute:'synopsis', value: 'The remote host is missing the GLSA-200602-03 security update.');
 script_set_attribute(attribute:'description', value: 'The remote host is affected by the vulnerability described in GLSA-200602-03
(Apache: Multiple vulnerabilities)


    Apache\'s mod_imap fails to properly sanitize the "Referer" directive of
    imagemaps in some cases, leaving the HTTP Referer header unescaped. A
    flaw in mod_ssl can lead to a NULL pointer dereference if the site uses
    a custom "Error 400" document. These vulnerabilities were reported by
    Marc Cox and Hartmut Keil, respectively.
  
Impact

    A remote attacker could exploit mod_imap to inject arbitrary HTML or
    JavaScript into a user\'s browser to gather sensitive information.
    Attackers could also cause a Denial of Service on hosts using the SSL
    module (Apache 2.0.x only).
  
Workaround

    There is no known workaround at this time.
  
');
script_set_attribute(attribute:'solution', value: '
    All Apache users should upgrade to the latest version, depending on
    whether they still use the old configuration style
    (/etc/apache/conf/*.conf) or the new one (/etc/apache2/httpd.conf).
    2.0.x users, new style config:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-servers/apache-2.0.55-r1"
    2.0.x users, old style config:
    # emerge --sync
    # emerge --ask --oneshot --verbose "=www-servers/apache-2.0.54-r16"
    1.x users, new style config:
    # emerge --sync
    # emerge --ask --oneshot --verbose "=www-servers/apache-1.3.34-r11"
    1.x users, old style config:
    # emerge --sync
    # emerge --ask --oneshot --verbose "=www-servers/apache-1.3.34-r2"
  ');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:H/Au:N/C:N/I:N/A:C');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-3352');
script_set_attribute(attribute: 'see_also', value: 'http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-3357');

script_set_attribute(attribute: 'see_also', value: 'http://www.gentoo.org/security/en/glsa/glsa-200602-03.xml');

script_end_attributes();

 script_copyright(english: "(C) 2009 Tenable Network Security, Inc.");
 script_name(english: '[GLSA-200602-03] Apache: Multiple vulnerabilities');
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Apache: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');

if ( ! get_kb_item('Host/Gentoo/qpkg-list') ) exit(1, 'No list of packages');
if (qpkg_check(package: "www-servers/apache", unaffected: make_list("ge 2.0.55-r1", "rge 2.0.54-r16", "eq 1.3.34-r2", "rge 1.3.34-r11", "rge 1.3.37"), vulnerable: make_list("lt 2.0.55-r1")
)) { security_warning(0); exit(0); }
exit(0, "Host is not affected");

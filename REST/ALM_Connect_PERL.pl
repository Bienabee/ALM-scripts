#!/usr/bin/perl 

# This script accesses, as a proxy, the REST API of the HP quality center
# Running it without query parameter, the complete list of defects is returned
# A query parameter, e.g. 'query={id[2283]}' will be passed as is to the HP QC API

# We are using the libcurl wrapper WWW::Curl::Easy
# The access is https, so a certificate has to be passed to libcurl
# The main point for using curl, however, is the authentication procedure:
# HP requires a preparative call to a special authentication service
# The authentication ticket will then be passed back as a cookie
# Only with this ticket, the real GET request on the defects can be performed

use WWW::Curl::Easy;

use strict;
use warnings;

use constant {
  URL_QC_DEFECTS   => "https://[QC DOMAIN]/qcbin/rest/domains/[DOMAIN]/projects/[PROJECT]/defects/",
  URL_QC_AUTH      => "https://[QC DOMAIN]/qcbin/authentication-point/authenticate",
  PATH_CERT        => "[PATH TO CREDENTIALS]"  # contains certificate and credentials, see below
  };

doRequest( URL_QC_DEFECTS . "?" . $ENV{QUERY_STRING} );
return 0;

sub doRequest {
  my ($url,$cookies,$response) = (shift,"","");
  eval {
    my $curl = get_curl_instance(\$cookies,\$response);
    authenticate( $curl );
    get( $curl, $url );
    if ($response =~ /.*?(<\?xml\b.*)/s) {
      print "Content-Type:text/xml\n\n";
      print $1;
      }
    else {
      die "The response from HP QC is not in XML format";
      }
    };
  if ($@) {
    print "Content-Type:text/plain\n\n$@";
    }
  }

sub get_curl_instance {

  my ($cookie,$response) = @_;

  my $curl = WWW::Curl::Easy->new( );  

  open( my $cookiefile, ">", $cookie) or die "$!";
  $curl->setopt( CURLOPT_COOKIEFILE, $cookiefile );  
  open( my $responsefile, ">", $response) or die "$!";  
  $curl->setopt( CURLOPT_WRITEDATA, $responsefile );  
  $curl->setopt( CURLOPT_SSL_VERIFYPEER, 1);
  $curl->setopt( CURLOPT_SSL_VERIFYHOST, 2);
  $curl->setopt( CURLOPT_CAINFO, cert() );  
  $curl->setopt( CURLOPT_FOLLOWLOCATION, 1 );
  return $curl;
  }

sub authenticate {
  my $curl = shift;
  my ($rc,$status);
  $curl->setopt( CURLOPT_URL, URL_QC_AUTH );
  $curl->setopt( CURLOPT_USERPWD, cred( ) );  
  if (($rc = $curl->perform( )) != 0) {
    die "Error Code $rc in curl->perform( ) on URL " . URL_QC_AUTH;
    }
  if (($status=$curl->getinfo(CURLINFO_HTTP_CODE))!="200") {
    die "HTTP-Statuscode $status from authentication call";
    }   
  }


sub  get {
  my ($curl,$url) = @_;
  my ($rc,$status);
  $curl->setopt( CURLOPT_URL, $url );
  $curl->setopt( CURLOPT_HEADER, { Accept => "text/xml" } );
  if (($rc = $curl->perform( )) != 0) {
    die "Error Code $rc from defects request";
    }
  if (($status=$curl->getinfo(CURLINFO_HTTP_CODE))!="200") {
    die "HTTP Statuscode $status from defects request";
    }   
  }

sub cred {
  open CRED, PATH_CERT . '/.cred_qc' or die "Can't open credentials file: $!";
  chomp( my $cred = <CRED>); 
  close CRED;
  return $cred;
  }

sub cert {
  return PATH_CERT . '/qc.migros.net.crt';
  }  

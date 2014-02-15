<?php

//create a new cURL resource
$qc = curl_init();
//create a cookie file
$ckfile = tempnam ("/tmp", "CURLCOOKIE");

//set URL and other appropriate options
curl_setopt($qc, CURLOPT_URL, "http://qualityCenter:8080/qcbin/rest/is-authenticated");
curl_setopt($qc, CURLOPT_HEADER, 0);
curl_setopt($qc, CURLOPT_HTTPGET, 1);
curl_setopt($qc, CURLOPT_RETURNTRANSFER, 1);

//grab the URL and pass it to the browser
$result = curl_exec($qc);
$response = curl_getinfo($qc);

//401 Not authenticated (as expected)
//We need to pass the Authorization: Basic headers to authenticate url with the 
//Correct credentials.
//Store the returned cookfile into $ckfile
//Then use the cookie when we need it......
if($response[http_code] == '401')
{

        $url = "http://qualityCenter:8080/qcbin/authentication-point/authenticate";
        $credentials = "qc_username:qc_password";
        $headers = array("GET /HTTP/1.1","Authorization: Basic ". base64_encode($credentials));

    curl_setopt($qc, CURLOPT_URL, $url);
    curl_setopt($qc, CURLOPT_HTTPGET,1); //Not sure we need these again as set above?
    curl_setopt($qc, CURLOPT_HTTPHEADER, $headers);
    //Set the cookie
        curl_setopt($qc, CURLOPT_COOKIEJAR, $ckfile);
        curl_setopt($qc, CURLOPT_RETURNTRANSFER, true);

        $result = curl_exec($qc);
        $response = curl_getinfo($qc);

       //The response will be 200   
       if($response[http_code] == '200')
       {
        //Use the cookie for subsequent calls...
        curl_setopt($qc, CURLOPT_COOKIEFILE, $ckfile);
        curl_setopt($qc, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($qc, CURLOPT_URL, "http://qualityCenter:8080/qcbin/rest/domains/Your_Domain/projects/Your_Project/defects");

    //In this example we are retrieving the xml so...
        $xml = simplexml_load_string(curl_exec($qc));
        print_r($xml);

    //Call Logout
        logout($qc,"http://qualityCenter:8080/qcbin/authentication-point/logout");

       }
       else
       {
        echo "Authentication failed";
       }

    }
else
{
        echo "Not sure what happened?!";
}

//Close cURL resource, and free up system resources
curl_close($qc);

function logout($qc, $url)
{
    curl_setopt($qc, CURLOPT_URL, $url);
        curl_setopt($qc, CURLOPT_HEADER, 0);
        curl_setopt($qc, CURLOPT_HTTPGET,1);
        curl_setopt($qc, CURLOPT_RETURNTRANSFER, 1);

    //grab the URL and pass it to the browser
    $result = curl_exec($qc);
}

?>

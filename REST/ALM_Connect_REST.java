DefaultHttpClient httpClient = new DefaultHttpClient();

            //The problem was in base64 encoding ! If you are converting string to base64 encoded string... if result is greater than 76 char. it adds new line ! even if its less than 76
            //So solution was

            //encoding = encoding.replaceAll("\n", "");


            String encoding = Base64.encodeBase64String("demoUser:demoUser123".getBytes());
            HttpGet httpGet = new HttpGet("http://HOST_VALUE:PORT_VALUE/qcbin/authentication-point/authenticate");
            //httpGet.setHeader("GET", "/qcbin/authentication-point/authenticate");
            httpGet.setHeader("Authorization:", "Basic " + encoding);
            HttpResponse response;



            httpClient.getCredentialsProvider().setCredentials(
                    new AuthScope("proxyHost", 8080),
                    new UsernamePasswordCredentials("userName", "Password"));




            response = httpClient.execute(httpGet);


            System.out.println(response.getAllHeaders().toString());
            System.out.println(response.getStatusLine().toString());
            BufferedReader br = new BufferedReader(
                    new InputStreamReader((response.getEntity().getContent())));

            String output;
            System.out.println("Output from Server .... \n");
            while ((output = br.readLine()) != null) {
                System.out.println(output);
            }
            httpClient.getConnectionManager().shutdown();

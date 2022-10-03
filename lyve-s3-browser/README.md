# Lyve-S3-Browser

## Introduction
Lyve-S3-Browser is a file browser for Lyve Cloud S3.
 
Lyve-S3-Browser is simply a browser-based client
Enabling Lyve Cloud users to browse,download and upload files over Lyve Cloud S3 bucket.


## Requirements
* Lyve Cloud
  * Access Key
  * Secret Key
  * S3 API Endpoint
  * Name of the bucket that contains files to browse
* Ubuntu or Linux compute instance
  * Apache installed
  * Port 80 open
  * Root or sudo access

## Known Limitations 
Currently file upload functionality is not working as CORS is not enabled and will be fixed in next release.

## Running Steps
 - Create a new bucket using https://help.lyvecloud.seagate.com/en/managing-buckets.html
   pay attention that you place the bucket in the region you want it to be in.

 - Create the permission that have full access to the bucket that has been created.
   Using the permission create the Service Account and note down the credentials.
   Refer help document https://help.lyvecloud.seagate.com/en/managing-service-accounts.html

 - Install and configure Apache on your ubuntu server using following steps
	'sudo apt update'
	'sudo apt install apache2'
	'sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/yourdomain.conf'
	configure VirtualHost setting inside your yourdomain.conf file with below parameters
	VirtualHost *:80
	ServerAdmin user@yourdomain.com
	DocumentRoot /var/www/html
	ServerName web.yourdomain.com

 - Clone the repo and set it in /var/www/html directory.
   Customize the s3 endpoint at the end of the index.html file, default endpoint is us-east Region.
   See https://help.lyvecloud.seagate.com/en/s3-api-endpoint.html#s3 region for a listing of proper endpoints.

 - Make sure port 80 is listing, you can verify with below command.
	'sudo netstat -tulpn | grep LISTEN'
   Restart the apache service with below command.
        'service apache2 restart'


## Results 
 - Hit the IP of the server where website is hosted or URL if DNS is configured on your local browser and you will land on console page.
<p style="text-align:left"><img alt="Console page" src="images/Landing_page.PNG" width="600"/></p>

 - Write the bucket name and add Access Key ID and Secret Access Key ID and click on Login button.
<p style="text-align:left"><img alt="Enter the details" src="images/bucket_details.PNG" width="600"/></p>

 - Brower will show the files stored on Lyve Cloud Bucket.
<p style="text-align:left"><img alt="Browse the Files" src="images/Browsing_files.PNG" width="600"/></p>

 - You can select any perticular file and download it.


## Tested by
* Sept 29, 2022: Rahul Gode (rahul.gode@seagate.com) on Ubuntu
* month day, year: full_name (email) on your_environment

## **Note:** All files should be uploaded (all the files you used for the integration solution) under one folder, including the README.md file. 
### Project Structure

This section will describe the representation of each of the folders or files in the structure.
```
.
├── README.md
├── index.html
├── code
│   └── css
        lyves3browser.css
│   └── js
        lyves3browser.js
        libs
└── images
    └── Landing_page.PNG
        bucket_details.PNG
        Browsing_files.PNG
```

### `/code`
This folder contains all the code files.

### `/images`
This folder contains all the images.

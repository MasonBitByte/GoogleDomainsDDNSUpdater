# GoogleDomainsDDNSUpdater
Google Domains Dynamic DNS Updater batch file for Windows 10, 11, and Linux bash
Updates DNS Record with IPv4 address of host machine, intended to be run on a schedule with Windows Task Scheduler or Cron. 
## Before Setup
Prior to editing the file, you will need to:
1. Enable Dynamic DNS on your domain with Google in the managment pannel under the DNS tab (click show advanced settings) 
2. Note the hostname down for that record in it's entirety (including subdomain, if applicable)
3. Click "View Credentials" and note down the provided username and password.
## Configure the file
Open the .bat or .sh file in a text editor.  The Variable Setup section should look like:
```
Rem Sets username var to Google Dynamic DNS API username to be ammended in the POST request.
set usr=

Rem Sets pw var to Google Dynamic DNS API Password to be ammended in the POST request.
set pw=

Rem Sets hostname var to the domain to be updated in the request.
set hostname= 
```
Now,
1. Change `set usr= ` to equal the provided username from earlier. Should look like: `set usr=ThisIsanAP1K3y`
2. Change `set pw= ` to equal the provided password from earlier. Should look like: `set pw=iAmapassw0rd`
3. Change `set hostanme= ` to equal the target hostname. Should look like: `set hostname=test.mason.com`
4. Save the file.
## Test configuration
Now run the batch with command prompt . It should output `good <your ip>` if the IP was successfully updated or `nochg <your IP>` if it was already set correctly, meaning no change occured. If either output happened, congratulations, the batch file is correctly configured. If the output reads something different, check the response codes [here](https://support.google.com/domains/answer/6147083?hl=en#zippy=%2Cuse-the-api-to-update-your-dynamic-dns-record)
and adjust based on your response code. 
Now you can run the batch file on a certian interval using taskschd.msc (Windows Task Scheduler) and it should run in the background automatically. 
## Notes
The API used for IP retrival is provided by [ipify-api](https://github.com/rdegges/ipify-api), as it outputs the simplest plaintext response, and is open source.

Linux users should give the script execute permissions (`sudo chmod 777 DDNS.sh` for example)
and insert their DDNS username, password, and hostname inside the double quotes, rather than without on Windows. (Should look like usr="ThisIsanAP1K3y")
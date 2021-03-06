@echo off
echo "Google Domains Dynamic DNS Updater v2 by MasonBitByte" 



Rem Variable Setup

Rem The Provided URI for the HTTPS GET request works fine for retrival of your Public IPv4 address in plaintext and is open source. For more information:https://www.ipify.org

Rem Sets username var to Google Dynamic DNS API username to be ammended in the POST request.
set usr=

Rem Sets pw var to Google Dynamic DNS API Password to be ammended in the POST request.
set pw=

Rem Sets hostname var to the domain to be updated in the request.
set hostname=

Rem Execution

Rem Retrives plaintext IP with curl and sets it to var ip 
for /f %%i in ('curl https://api.ipify.org -s') do set ip=%%i

Rem Formats Request and sets it as a var request
set request="https://%usr%:%pw%@domains.google.com/nic/update?hostname=%hostname%&myip=%ip%"

Rem POSTS formatted request (var request) with curl and  sets var output to POST response.
for /f %%i in ('curl %request% ') do set output=%%i

Rem Echo POST response (var output) to user.
echo %output%
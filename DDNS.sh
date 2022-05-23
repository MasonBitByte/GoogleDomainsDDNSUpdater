echo "Google Domains Dynamic DNS Updater v2 by MasonBitByte"

#Variable Setup

#The Provided URI for the HTTPS GET request works fine for retrival of your Public IPv4 address and is open source. For more information:https://www.ipify.org

#Sets username var to Google Dynamic DNS API username to be ammended in the POST request.
usr=""

#Sets pw var to Google Dynamic DNS API Password to be ammended in the POST request

pw=""

#Sets hostname var to the domain to be updated in the request.
hostname=""

#Execution

#Retrives plaintext IP with curl and sets it to var ip
ip=$(curl https://api.ipify.org -s)

#Formats the request and sets it to a variable request

request=("https://"$usr:$pw"@domains.google.com/nic/update?hostname="$hostname"&myip="$ip)

#Curls the finalized POST Request
curl $request -s

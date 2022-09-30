import environ
environ.Env.read_env()
import caselawclient.Client
from requests_toolbelt.multipart import decoder
client = caselawclient.Client.api_client

response = client.eval(xquery_path="my_xquery.xqy", vars='{"mindoc":1, "maxdoc":4}', accept_header="application/xml")
multipart_data = decoder.MultipartDecoder.from_response(response)
for part in multipart_data.parts:
  print (part.text)

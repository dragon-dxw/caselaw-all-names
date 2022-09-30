import environ
environ.Env.read_env()
import caselawclient.Client
from requests_toolbelt.multipart import decoder
import json
client = caselawclient.Client.api_client

mindoc=1
maxdoc=3
vars = json.dumps({'mindoc': mindoc, 'maxdoc': maxdoc})


response = client.eval(xquery_path="my_xquery.xqy", vars=vars, accept_header="application/xml")
multipart_data = decoder.MultipartDecoder.from_response(response)
for part in multipart_data.parts:
  print (part.text)

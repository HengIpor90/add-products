<!-- QR CODE -->
from bakong_khqr import KHQR
import base64


print("_"*30)

print(f"QR CODE String:",qr_string)

app = FastAPI(title="Café Signal POS & Security API")
client = AsyncIOMotorClient("mongodb://Deploy:zHTe1XRTjlenMrKR@ac-i0odsqd-shard-00-00.q6vrjgy.mongodb.net:27017,ac-i0odsqd-shard-00-01.q6vrjgy.mongodb.net:27017,ac-i0odsqd-shard-00-02.q6vrjgy.mongodb.net:27017/?ssl=true&replicaSet=atlas-4baf7h-shard-0&authSource=admin&appName=Cluster0")
db = client.app_signal
# create deeplink 
# bakong allow ,we usage on Base64 Encode QR String in url

encoded_qr = base64.b64encode(qr_string.encode()).decode()
deeplinks = f"https://bakong.nbc.org.kh/{encoded_qr}"

print(f"="*30)
print(f"Deeplinks for send to client :",deeplinks)


<!-- .env -->

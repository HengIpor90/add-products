
from contextlib import asynccontextmanager
from configs.db_config import DatabaseInfo
@asynccontextmanager
async def lifespan(app: DatabaseInfo):
    # --- ដំណើរការពេល Start App ---
    
     # បង្កើត Index ដើម្បីការពារការចុះឈ្មោះស្ទួន (ទោះ Logic Python ភ្លេចឆែក ក៏ DB ប្លុកជាប់ដែរ)
    await app.mongodb.users.create_index("username", unique=True)
    await app.mongodb.users.create_index("email", unique=True)
    
    yield  # កន្លែងដែល App កំពុងរត់
    
    # --- ដំណើរការពេល Stop App ---
    app.mongodb_client.close()
    print("🛑 បានបិទការភ្ជាប់ MongoDB")

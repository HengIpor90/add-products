async def upsert_product_logic(db, product_data):
    # ការប្រើ upsert=True ដើម្បីការពារទិន្នន័យស្ទួនតាម Title
    return await db.products.update_one(
        {"title": product_data.title},
        {"$set": product_data.model_dump()},
        upsert=True
    )

async def get_products_logic(db):
    products = await db.products.find().to_list(length=100)
    for p in products:
        p["_id"] = str(p["_id"]) # បំប្លែង ObjectId ទៅជា String
    return products
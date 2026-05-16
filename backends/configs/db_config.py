import os
from motor.motor_asyncio import AsyncIOMotorClient
from contextlib import asynccontextmanager
from fastapi import FastAPI

@asynccontextmanager
async def DatabaseInfo(db:FastAPI):
    db_mongo_url = os.getenv('MONGODB_URL')
    db.mongodb_client = AsyncIOMotorClient(db_mongo_url)
    db.mongodb = db.mongodb_client.app_signal
from pydantic import BaseModel, Field

class ProductCreate(BaseModel):
    title: str = Field(..., min_length=2)
    price: float = Field(..., gt=0)
    qty: int = Field(..., ge=0)
    description: str = Field(..., max_length=500)

class BakongConfig(BaseModel):
    merchant_name: str
    bank_account: str
    merchant_city: str = "Phnom Penh"
    currency: str = "USD"
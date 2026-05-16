from pydantic import BaseModel, EmailStr, Field
from enum import Enum
from datetime import datetime, timezone

class UserRole(str, Enum):
    admin = "admin"
    user = "user"

class UserRegister(BaseModel):
    username: str = Field(..., min_length=3, max_length=20)
    email: EmailStr
    password: str = Field(..., min_length=8)
    role: UserRole = UserRole.user
    created_at: datetime = Field(default_factory=lambda: datetime.now(timezone.utc))

class UserLogin(BaseModel):
    username: str
    password: str

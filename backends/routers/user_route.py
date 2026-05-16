from fastapi import APIRouter, HTTPException, Request
from models.user_model import UserRegister, UserLogin
from controllers.user_controller import register_user_logic, login_user_logic
router = APIRouter(prefix="/auth", tags=["Authentication"])

@router.post("/register")
async def register(request: Request, user: UserRegister):
    db = request.app.mongodb
    result, error = await register_user_logic(db, user)
    
    if error:
        raise HTTPException(status_code=400, detail=error)
        
    return {"message": "User registered successfully"}

@router.post("/login")
async def login(request: Request, login_data: UserLogin):
    db = request.app.mongodb
    user, error = await login_user_logic(db, login_data)
    
    if error:
        # បើខុស ឱ្យបោះលេខ 401 (Unauthorized)
        raise HTTPException(status_code=401, detail=error)
        
    return {
        "status": "success",
        "message": "ចូលប្រើប្រាស់បានជោគជ័យ",
        "user": user
    }

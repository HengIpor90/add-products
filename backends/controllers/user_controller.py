import bcrypt

def hash_password(password: str):
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')

def verify_password(password: str, hashed: str):
    return bcrypt.checkpw(password.encode('utf-8'), hashed.encode('utf-8'))

async def register_user_logic(db, user_data):
    # ១. ឆែកមើលថា តើមាន Username ឬ Email នេះហើយឬនៅ?
    existing_user = await db.users.find_one({
        "$or": [
            {"username": user_data.username},
            {"email": user_data.email}
        ]
    })
    
    if existing_user:
        # បើមានហើយ បញ្ឈប់ការចុះឈ្មោះ រួចប្រាប់ថាមានហើយ
        return None, "Username or Email already exists"

    # ២. បើអត់ទាន់មានទេ ទើបឱ្យវាចុះឈ្មោះ
    user_dict = user_data.model_dump()
    user_dict["password"] = hash_password(user_data.password)
    
    result = await db.users.insert_one(user_dict)
    return result, None

# មុខងារឆែកលេខសម្ងាត់
def verify_password(plain_password: str, hashed_password: str):
    return bcrypt.checkpw(plain_password.encode('utf-8'), hashed_password.encode('utf-8'))

async def login_user_logic(db, login_data):
    # ១. រកមើល User តាមរយៈ username
    user = await db.users.find_one({"username": login_data.username})
    
    if not user:
        return None, "រកមិនឃើញគណនីនេះទេ"

    # ២. ផ្ទៀងផ្ទាត់ Password
    if not verify_password(login_data.password, user["password"]):
        return None, "លេខសម្ងាត់មិនត្រឹមត្រូវ"

    # ៣. បើត្រឹមត្រូវ បញ្ជូនព័ត៌មាន User ត្រឡប់ទៅវិញ (លើកលែងតែ password)
    return {
        "id": str(user["_id"]),
        "username": user["username"],
        "email": user["email"],
        "role": user["role"],
    }, None


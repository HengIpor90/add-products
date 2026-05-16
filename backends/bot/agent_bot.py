from dotenv import load_dotenv
import os
import json
import re

from langchain_core.messages import HumanMessage
from langchain_groq import ChatGroq

load_dotenv()

# =========================
# AI MODEL
# =========================
model = ChatGroq(
    model="llama-3.3-70b-versatile",
    api_key=os.getenv("GROQ_API_KEY"),
    temperature=0.7,
    max_tokens=200
)

# =========================
# FILE PATH
# =========================
FILE_NAME = "products.json"

# =========================
# LOAD JSON FILE
# =========================
def load_data():
    if not os.path.exists(FILE_NAME):
        return []
    with open(FILE_NAME, "r") as f:
        return json.load(f)

# =========================
# SAVE JSON FILE
# =========================
def save_data(data):
    with open(FILE_NAME, "w") as f:
        json.dump(data, f, indent=4)

# =========================
# EXTRACT JSON FROM AI
# =========================
def extract_json(text):
    try:
        match = re.search(r"\{.*\}", text, re.DOTALL)
        if match:
            return json.loads(match.group())
    except:
        return None
    return None

# =========================
# AI GENERATE PRODUCT
# =========================
def generate_product(user_text):

    prompt = f"""
Return ONLY JSON:

{{
  "name": "product name",
  "description": "short description max 20 words"
}}

User: {user_text}
"""

    res = model.invoke([HumanMessage(content=prompt)])

    return extract_json(res.content)

# =========================
# MAIN
# =========================
print("🤖 AI PRODUCT SYSTEM WITH SAVE FILE")

while True:

    user = input("\nEnter idea: ")

    if user.lower() == "quit":
        break

    # =========================
    # LOAD EXISTING DATA
    # =========================
    products = load_data()

    # =========================
    # AI GENERATE
    # =========================
    product = generate_product(user)

    if not product:
        print("❌ AI failed")
        continue

    # =========================
    # ADMIN INPUT
    # =========================
    price = float(input("💰 Enter price: "))
    stock = int(input("📦 Enter stock: "))

    final_product = {
        "name": product["name"],
        "description": product["description"],
        "price": price,
        "stock": stock
    }

    # =========================
    # ADD TO LIST
    # =========================
    products.append(final_product)

    # =========================
    # SAVE FILE
    # =========================
    save_data(products)

    print("\n✅ SAVED SUCCESSFULLY!")
    print("📁 File: products.json")

    print("\n📦 CURRENT PRODUCT:")
    print(json.dumps(final_product, indent=4))
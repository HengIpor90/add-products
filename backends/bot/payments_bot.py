from dotenv import load_dotenv
import os
import qrcode

from langchain_core.messages import HumanMessage
from langchain_groq import ChatGroq

from bakong_khqr import KHQR # pyright: ignore[reportMissingImports]

# =========================
# LOAD ENV
# =========================
load_dotenv()

GROQ_API = os.getenv("GROQ_API_KEY")
BAKONG_TOKEN = os.getenv("BAKONG_TOKEN")

# =========================
# AI MODEL
# =========================
model = ChatGroq(
    model="llama-3.3-70b-versatile",
    api_key=GROQ_API,
    temperature=0.3,
    max_tokens=200
)

# =========================
# KHQR INIT
# =========================
khqr = KHQR(BAKONG_TOKEN)

# =========================
# PRODUCTS
# =========================
products = {
    "iphone 15": 999,
    "samsung s24": 850,
    "macbook pro": 1999
}

# =========================
# STATE
# =========================
state = {
    "product": None,
    "step": "chat"
}

# =========================
# QR GENERATOR (FALLBACK)
# =========================
def generate_qr(product, price):
    data = f"KHQR PAYMENT\n{product}\n${price}"
    img = qrcode.make(data)
    file = "khqr.png"
    img.save(file)
    return file

# =========================
# CHATBOT START
# =========================
print("🤖 FT AI SHOP STARTED")

while True:

    user = input("\nYou: ").lower()

    if user == "quit":
        break

    # =========================
    # AI CHAT (DEFAULT)
    # =========================
    def ai_reply(text):
        response = model.invoke([HumanMessage(content=text)])
        return response.content

    # =========================
    # FIND PRODUCT
    # =========================
    found = None
    for p in products:
        if p in user:
            found = p
            break

    # =========================
    # STEP 1: PRODUCT FOUND
    # =========================
    if found and state["step"] == "chat":

        state["product"] = found
        state["step"] = "buy"

        print(f"""
Agent:
Product: {found}
Price: ${products[found]}

Do you want to buy it? (yes/no)
""")
        continue

    # =========================
    # STEP 2: BUY CONFIRM
    # =========================
    if state["step"] == "buy":

        if "yes" in user:

            state["step"] = "payment"

            print("""
Agent:
Purchase confirmed!

Choose payment method:
- KHQR
- Credit Card
""")
            continue

        else:

            state["step"] = "chat"
            state["product"] = None

            print("Agent: Cancelled.")
            continue

    # =========================
    # STEP 3: PAYMENT
    # =========================
    if state["step"] == "payment":

        product = state["product"]
        price = products[product]

        # KHQR PAYMENT
        if "khqr" in user:

            try:
                result = khqr.create_qr(
                    bank_account="hengipor_soth1@bkrt",
                    merchant_name="FT AI Shop",
                    merchant_city="Phnom Penh",
                    amount=price,
                    currency="KHR",
                    store_label="FT AI",
                    phone_number="012579543",
                    bill_number="FTX001",
                    terminal_label="AI POS",
                    static=False
                )

                print("\nAgent: KHQR Generated Successfully")
                print(result)

            except Exception:
                file = generate_qr(product, price)
                print(f"Agent: QR fallback generated -> {file}")

            state["step"] = "chat"
            state["product"] = None
            continue

        elif "credit" in user:
            print("Agent: Credit card payment selected (demo mode).")
            continue

        else:
            print("Agent: Please choose KHQR or Credit Card.")
            continue

    # =========================
    # NORMAL AI CHAT
    # =========================
    try:
        reply = ai_reply(user)
        print("Agent:", reply)

    except Exception as e:
        print("Error:", e)
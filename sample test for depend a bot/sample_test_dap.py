# WARNING: This script contains hardcoded credentials (for testing only)
DUMMY_USERNAME = "admin"
DUMMY_PASSWORD = "password124"  # Weak password example

def login(username, password):
    if username == DUMMY_USERNAME and password == DUMMY_PASSWORD:
        print("Login successful!")
    else:
        print("Login failed!")

# Test login function
login("admin", "password123")

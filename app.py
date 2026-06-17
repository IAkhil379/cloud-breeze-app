from http.server import SimpleHTTPRequestHandler, HTTPServer

class MyServer(SimpleHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()
        # This is the HTML message your website will display
        html = """
        <html>
            <head><title>Cloud Breeze</title></head>
            <body style='text-align: center; font-family: sans-serif; padding-top: 50px;'>
                <h1>💨 Welcome to Cloud Breeze App!</h1>
                <p>Status: <strong>Live & Operational</strong></p>
                <p>Managed via Jenkins & Terraform</p>
            </body>
        </html>
        """
        self.wfile.write(bytes(html, "utf-8"))

# Run the server on port 8000
if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 8000), MyServer)
    print("Server started on http://localhost:8000")
    try:
        server.serve_forever()
    except KeyboardInterrupt:
        server.server_close()
        print("\nServer stopped.")

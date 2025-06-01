from flask import Flask, jsonify, request
import psycopg2
import random

app = Flask(__name__)

# Database configuration
DB_HOST = "postgres-svc"
DB_NAME = "snake_game"
DB_USER = "postgres"
DB_PASS = "password"

def get_db_connection():
    return psycopg2.connect(
        host=DB_HOST,
        database=DB_NAME,
        user=DB_USER,
        password=DB_PASS
    )

@app.route('/start', methods=['POST'])
def start_game():
    # Implementation for version 1
    pass

@app.route('/move', methods=['POST'])
def make_move():
    # Implementation for version 1
    pass

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)

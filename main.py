from flask import Flask, render_template
import pymysql.cursors
 
# Connect to the database
connection = pymysql.connect(host='localhost',
                             user='root',
                             password='aluno123',
                             db='projeto',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

cursor = connection.cursor()
app = Flask(__name__)
@app.route('/')
def home():
    sql = 'select * from receitas'
    results = cursor.fetchone()
    
    return render_template('index.html', receitas=receitas)

@app.route('/users')
def users():
    sql = 'select * from users'
    cursor.execute(sql)
    results = cursor.fetchone()
    return render_template('user.html')

@app.route('/login')
def login():
    return render_template('login.html')

app.run(debug=True, host='0.0.0.0')

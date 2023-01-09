import os

from flask import Flask
import pymysql

db_user = os.environ.get('CLOUD_SQL_USERNAME')
db_password = os.environ.get('CLOUD_SQL_PASSWORD')
db_name = os.environ.get('CLOUD_SQL_DATABASE_NAME')
db_connection_name = os.environ.get('CLOUD_SQL_CONNECTION_NAME')

app = Flask(__name__)


@app.route('/')
def main():
    if os.environ.get('GAE_ENV') == 'standard':

        unix_socket = '/cloudsql/{}'.format(db_connection_name)
        cnx = pymysql.connect(user=db_user, password=db_password,
                              unix_socket=unix_socket, db=db_name)
    else:
        host = '127.0.0.1'
        cnx = pymysql.connect(user=db_user, password=db_password,
                              host=host, db=db_name)

    with cnx.cursor() as cursor:
        cursor.execute('select demo_txt from demo_tbl;')
        result = cursor.fetchall()
        current_msg = result[0][0]
    cnx.close()

    return str(current_msg)



if __name__ == '__main__':
    app.run(host='127.0.0.1', port=8080, debug=True)
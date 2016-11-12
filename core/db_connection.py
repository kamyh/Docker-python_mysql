import MySQLdb

if __name__ == '__main__':
    db=MySQLdb.connect(host='172.17.0.3', user='admin', passwd='root', db='mysql')
    cursor = db.cursor()
    cursor.execute("SHOW DATABASES;")
    db.close()
    data = cursor.fetchall()
    print data

#db=MySQLdb.connect(port=3316, host='localhost', user='admin', passwd='root', db='mysql')
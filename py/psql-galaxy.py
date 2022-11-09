import csv, psycopg2

DB_NAME = "universe"
DB_USER = "psql"
DB_PASS = "secret"
DB_HOST = "127.0.0.1"
DB_PORT = "5432"

def insert_query(table, columns, values):
        col_str = ""
        val_str = ""
        sql = ""
        for col in columns:
                # col_str += "\'" + col + "\',"
                col_str +=  col + ","
        col_str = col_str[0:len(col_str)-1].replace("\n", "")
        
        for val in values:
                val_str += "\'" + val.replace(" ", " ") + "\',"
                # val_str += "\'" + val.replace("’", "''").replace(" ", " ") + "\',"
        val_str = val_str[0:len(val_str)-1].replace("\n", "")
        sql = "INSERT INTO " + table + " (" + col_str + ") VALUES (" + val_str + ")" 
        # print(sql)
        
        try:
                conn = psycopg2.connect(database=DB_NAME,
                                user=DB_USER,
                                password=DB_PASS,
                                host=DB_HOST,
                                port=DB_PORT)
                print("Database connected successfully")
        
                cur = conn.cursor()  # creating a cursor
                cur.execute(sql)
                # print(sql)
                # return 
                # # executing queries to create table
                # cur.execute("""
                # CREATE TABLE Employee
                # (
                # ID INT   PRIMARY KEY NOT NULL,
                # NAME TEXT NOT NULL,
                # EMAI TEXT NOT NULL
                # )
                # """)
                
                # commit the changes
                conn.commit()
                print("Table Created successfully")
        except:
                print(sql)
                print("Database not connected successfully")
        conn.close()
        
        
        
        

with open("./galaxy.csv", "r", encoding="utf-8-sig") as file:
        header = next(file).split(",")
        reader = csv.reader(file, delimiter=",")
        table = "galaxy"
        for row in reader:
                # print("h", header, type(header))
                insert_query(table, header, row)
                # rows.append(row)
                
#print(rows)
        
        
        



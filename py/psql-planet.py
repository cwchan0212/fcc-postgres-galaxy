import csv, psycopg2

DB_NAME = "universe"
DB_USER = "psql"
DB_PASS = "secret"
DB_HOST = "127.0.0.1"
DB_PORT = "5432"

def num(s):
        try:
                
                if float(s) % 10 == 0:
                        return int(s)
                else:
                        return float(s)
        except ValueError:
                return -1

def insert_query(table, columns, values):
        col_str = ""
        val_str = ""
        sql = ""
        for col in columns:
                # col_str += "\'" + col + "\',"
                col_str +=  col + ","
        col_str = col_str[0:len(col_str)-1].replace("\n", "")
        
        i = 0
        for val in values:   
                           
                if num(val) == False:
                        val_str += "\'" + val.replace(" ", " ") + "\',"
                        # val_str += "\'" + val.replace("’", "''").replace(" ", " ") + "\',"
                else:
                        if i >= 19: 
                                val = True if val else False
                        else:     
                                val = str(val)
                        val_str += "\'" + str(val) + "\',"           
                                # val_str += "\'" + str(val) + "\',"
                i += 1
                
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
                
                conn.commit()
                print("Table Created successfully")
        except:
                print(sql)
                print("Database not connected successfully")
        conn.close()
        
        
        
        

with open("./planet.csv", "r", encoding="utf-8-sig") as file:
        header = next(file).split(",")
        reader = csv.reader(file, delimiter=",")
        table = "planet"
        for row in reader:
                # print("h", header, type(header))
                insert_query(table, header, row)
                # rows.append(row)
                
#print(rows)
        
        
        



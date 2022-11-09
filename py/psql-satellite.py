import csv
import psycopg2

DB_NAME = "universe"
DB_USER = "psql"
DB_PASS = "secret"
DB_HOST = "127.0.0.1"
DB_PORT = "5432"

def geconv(str):

        greek = ["α", "ά", "β", "γ", "δ", "ε", "έ", "ζ", ",η", "ή", "θ", "ι", "ί", "κ", "λ",
                "μ", "ν", "ξ", "ο", "ό", "π", "ρ", "σ", "ς", "τ", "υ", "ύ", "φ", "χ", "ψ", "ω" "ώ", "η", "ω"]

        english = ["a", "a", "b", "c", "d", "e", "e", "z", "h", "i", "t", "h", "i", "c", "l",
                "m", "n", "x", "o", "p", "r", "s", "s", "t", "y", "f", "h", "p", "s", "o", "o", "i", "oh"]

        gedict = {}
        for g, e in zip(greek, english):
                gedict[g] = e

        ss = list(str)
        vs = ""
        for s in ss:  
                if s in gedict.keys():
                        vs += gedict[s]
                else:
                        vs += s
        return vs        
                

def num(s):
    try:
        if float(s) % 10 == 0:
            return int(s)
        else:
            return float(s)
    except ValueError:
        return -1


def insert_bulk(table, columns, values):
    val_str = ""
    for val in values:
        val_str += "\'" + val.replace("’", "''").replace(" ", " ") + "\',"
    
    val_str = "(" + val_str[0:len(val_str)-1] + "),"
    return val_str

def insert_query(table, columns, values):
    col_str = ""
    val_str = ""
    sql = ""
    for col in columns:
        # col_str += "\'" + col + "\',"
        col_str += col + ","
    col_str = col_str[0:len(col_str)-1].replace("\n", "")

    # for val in values:
    #     # val = geconv(val)
    #     val_str += "\'" + val.replace("’", "''").replace(" ", " ") + "\',"

    # val_str = val_str[0:len(val_str)-1].replace("\n", "")

    
    # sql = "INSERT INTO " + table + \
    #     " (" + col_str + ") VALUES (" + val_str + ")"
    
    sql = "INSERT INTO " + table + " (" + col_str + ") VALUES " + values
    # print(sql)
    with open("satellite.txt", "w", encoding='utf-8') as f:
        f.write(sql)        

    try:
        conn = psycopg2.connect(database=DB_NAME,
                                user=DB_USER,
                                password=DB_PASS,
                                host=DB_HOST,
                                port=DB_PORT)
        # conn.set_client_encoding('WIN1252')
        print("Database connected successfully")

        cur = conn.cursor()  # creating a cursor
        # cur.execute(sql)
        print(sql)
        # conn.commit()
        
        

        print("Table Created successfully")
    except:
        print(sql)
        print("Database not connected failed")
    conn.close()


with open("./satellite.csv", "r", encoding="utf-8-sig") as file:
    header = next(file).split(",")
    reader = csv.reader(file, delimiter=",")
    table = "satellite"
    stsum = ""
    for row in reader:
        # print("h", header, type(header))
        # insert_query(table, header, row)
        st = ""
        for r in row:                
                if num(r) != -1: 
                        st += r + ","  
                else: 
                        st += "'" + r + "',"
        st = "(" + st[0:len(st)-1] + "),"
        # sql += "(%s, %s, %s), " % (row[0], row[1], row[2])
        stsum += st + "\n"
    stsum = stsum[0:len(stsum)-1]
    insert_query(table, header, stsum)
    
        # insert_bulk("", row)
        # rows.append(row)

# print(rows)

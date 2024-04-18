import psycopg2
# sudo apt install python3-psycopg2

# Connect to local postgreSQL database.
conn = psycopg2.connect(
    database = "datastore", 
    user = "postgres", 
    password = "okayGo!", 
    host = "127.0.0.1", 
    port = "5432"
)
print("Opened database successfully")

# Grab data from psql database table.
cur = conn.cursor()
cur.execute("select * from accounts;")
rows = cur.fetchall()

# Outputs from database.
for row in rows:
    print(row)

# Shutdown
conn.commit()
conn.close()
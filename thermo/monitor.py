import random
import sqlite3
import os
import time

dbname = "templog.db"

def get_temp():
    return random.randint(0,50)

def log_temp(temp):
      conn=sqlite3.connect(dbname)
      curs=conn.cursor()
#CREATE TABLE uw_Thermo_temps(uw_temperature real NOT NULL,uw_created text NOT NULL,
      curs.execute("INSERT INTO uw_Thermo_temps (uw_temperature, uw_created) values((?),datetime('now'))", (temp,))
      conn.commit()
      conn.close()

def main():
    for i in range(100):
       temperature = get_temp()
       print temperature
       time.sleep(60)
       log_temp(temperature)

if __name__=="__main__":
    main()

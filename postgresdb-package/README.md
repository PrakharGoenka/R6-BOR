# PostgresDB Package

PostgresDB Package for interfacing with the PostgreSQL Database Server, this package provides functionality for initializing the database with required tables, inserting records to the database and retrieving the records.

# API Interface

* **Package name:** postgresdb
* **Class name:** PostgresDB

## Database Connection Configuration

*  void setDBUrlPort(String url, String port)
*  void setDBName(String name)
*  void setUsernamePassword(String username, String password)

## Insert and Retrieve Record

* void insertRecord(HashMap<String, String> record)
* HashMap<String, String> retrieveRecord(int serial_number)

### Details of HashMap Record

**Keys:** <br>
* district
* tehesil
* Village
* share_added
* share_removed
* mall_guzari
* order_number
* date
* remark
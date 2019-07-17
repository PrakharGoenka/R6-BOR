# Frontend

Frontend directory is the Netbeans Project Directory for the R6 Web Form. The project uses Apache Tomcat Server.

## Instructions
* Add Apache Tomcat server files to the poject.
* Add the required JDBC Drivers.

### Initializing the Database 
*  Execute the **InitializeDatabase()** function in /frontend/web/response.jsp
    This will initialize a database with configurations given in the same file.
*  The configurations can be altered depending on the requirements. Two copies of configuration exist, each in response.jsp and result.jsp

### Web Pages
* The project starts from **index.jsp**. This page contains the web-forms each for Viraasat & Dhaara 34. Other Court Orders has not yet been implemented. The forms are rendered based on the choice of mode of transfer.
* The response of the forms is sent to **response.jsp** . Data is inserted to the database here. It also provides option to search for a record.
* The **result.jsp** page displays the result of the record search. It provides option to save a record as PDF.

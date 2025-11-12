# Hibernate Employee CRUD Operations

This project demonstrates Hibernate ORM implementation with annotations for Employee management system, including both standard Hibernate and HQL (Hibernate Query Language) operations.

## Project Structure

```
Hibernate-Employee-CRUD/
├── src/
│   ├── Employee.java           # Entity class with Hibernate annotations
│   ├── HibernateUtil.java      # Session factory management
│   ├── EmployeeCRUD.java       # CRUD operations using Hibernate methods
│   ├── EmployeeHQL.java        # CRUD operations using HQL
│   ├── MainTest.java           # Test/Demo class
│   └── resources/
│       └── hibernate.cfg.xml   # Hibernate configuration
└── README.md
```

## Features

### 1. Employee Entity Class (Employee.java)
- Maps to "employee" table using `@Entity` and `@Table` annotations
- Uses `@Id` and `@GeneratedValue` for primary key
- Contains fields: id, name, salary
- Implements getters and setters

### 2. CRUD Operations

#### EmployeeCRUD.java - Standard Hibernate Methods
- **Add Employee**: Saves new employee records
- **Delete Employee**: Removes employee by ID
- **Update Salary**: Increases employee salary by 10%

#### EmployeeHQL.java - HQL Implementation  
- **Add Employee**: Uses session.save()
- **Delete Employee**: Uses HQL DELETE query
- **Update Salary**: Uses HQL UPDATE query with 10% increment

### 3. Configuration
- MySQL database connection
- Hibernate dialect: MySQL8Dialect
- Auto schema update enabled
- SQL logging enabled for debugging

## Setup Instructions

### Prerequisites
- Java Development Kit (JDK) 8 or higher
- MySQL Server
- Hibernate libraries
- MySQL Connector/J

### Database Setup
1. Create a MySQL database:
```sql
CREATE DATABASE employee_db;
```

2. Update `hibernate.cfg.xml` with your MySQL credentials:
```xml
<property name="hibernate.connection.username">your_username</property>
<property name="hibernate.connection.password">your_password</property>
```

### Required Dependencies
Add these JARs to your project classpath:
- hibernate-core
- hibernate-annotations
- mysql-connector-java
- javax.persistence-api

## Running the Application

1. Compile all Java files
2. Run `MainTest.java` to execute CRUD operations:

```bash
javac *.java
java MainTest
```

## Output Example

```
===== Employee CRUD Operations Test =====

1. Testing CRUD Operations:
Added 2 employees
Updated employee ID 1 salary by 10%
Deleted employee ID 2

2. Testing HQL Operations:
Added employee using HQL
Updated employee ID 1 salary using HQL

===== All tests completed successfully! =====
```

## Key Concepts Demonstrated

1. **Hibernate Annotations**:
   - @Entity, @Table, @Id, @GeneratedValue, @Column

2. **Session Management**:
   - SessionFactory creation and management
   - Transaction handling

3. **CRUD Operations**:
   - Create (save)
   - Read (get)
   - Update (update)
   - Delete (delete)

4. **HQL (Hibernate Query Language)**:
   - UPDATE queries with parameters
   - DELETE queries with conditions

## Assignment Requirements

This project fulfills:
- ✅ Create Employee class mapped with Hibernate annotations
- ✅ Add new employee
- ✅ Delete existing employee  
- ✅ Update salary by 10%
- ✅ Implement HQL for all operations

## Notes

- The `hibernate.hbm2ddl.auto` property is set to "update", which automatically creates/updates tables
- All SQL queries are logged to console for learning purposes
- Entity class uses annotations instead of XML mapping files

## Author

Created as part of Java/Hibernate practical exercises.

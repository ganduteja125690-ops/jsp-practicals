public class MainTest {
    public static void main(String[] args) {
        System.out.println("===== Employee CRUD Operations Test =====");
        
        // Test using standard Hibernate methods
        System.out.println("\n1. Testing CRUD Operations:");
        EmployeeCRUD crud = new EmployeeCRUD();
        
        // Add employees
        crud.addEmployee("John Doe", 50000);
        crud.addEmployee("Jane Smith", 60000);
        System.out.println("Added 2 employees");
        
        // Update salary (10% increase)
        crud.updateSalary(1);
        System.out.println("Updated employee ID 1 salary by 10%");
        
        // Delete employee
        crud.deleteEmployee(2);
        System.out.println("Deleted employee ID 2");
        
        // Test using HQL
        System.out.println("\n2. Testing HQL Operations:");
        EmployeeHQL hql = new EmployeeHQL();
        
        // Add employee
        hql.addEmployee("Bob Johnson", 55000);
        System.out.println("Added employee using HQL");
        
        // Update salary using HQL
        hql.updateSalary(1);
        System.out.println("Updated employee ID 1 salary using HQL");
        
        System.out.println("\n===== All tests completed successfully! =====");
    }
}

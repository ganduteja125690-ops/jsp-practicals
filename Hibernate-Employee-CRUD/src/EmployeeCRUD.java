import org.hibernate.Session;
import org.hibernate.Transaction;

public class EmployeeCRUD {
    public void addEmployee(String name, double salary) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Employee emp = new Employee(name, salary);
        session.save(emp);
        tx.commit();
        session.close();
    }
    public void deleteEmployee(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Employee emp = session.get(Employee.class, id);
        if (emp != null) session.delete(emp);
        tx.commit();
        session.close();
    }
    public void updateSalary(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Employee emp = session.get(Employee.class, id);
        if (emp != null) {
            emp.setSalary(emp.getSalary() * 1.10);
            session.update(emp);
        }
        tx.commit();
        session.close();
    }
}

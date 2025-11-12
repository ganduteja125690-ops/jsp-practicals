import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class EmployeeHQL {
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
        Query<?> query = session.createQuery("delete from Employee where id = :id");
        query.setParameter("id", id);
        query.executeUpdate();
        tx.commit();
        session.close();
    }
    public void updateSalary(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Query<?> query = session.createQuery("update Employee set salary = salary * 1.1 where id = :id");
        query.setParameter("id", id);
        query.executeUpdate();
        tx.commit();
        session.close();
    }
}

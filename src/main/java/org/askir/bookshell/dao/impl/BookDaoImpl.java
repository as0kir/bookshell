package org.askir.bookshell.dao.impl;

import org.askir.bookshell.dao.interfaces.BookDAO;
import org.askir.bookshell.entities.Book;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.*;
import org.hibernate.query.Query;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

@Component
public class BookDaoImpl implements BookDAO {

    @Autowired
    private SessionFactory sessionFactory;

    private ProjectionList bookProjection;

    private List<Book> books;

    public BookDaoImpl() {
        bookProjection = Projections.projectionList();
        bookProjection.add(Projections.property("id"), "id");
        bookProjection.add(Projections.property("title"), "title");
        bookProjection.add(Projections.property("description"), "description");
        bookProjection.add(Projections.property("author"), "author");
        bookProjection.add(Projections.property("isbn"), "isbn");
        bookProjection.add(Projections.property("printYear"), "printYear");
        bookProjection.add(Projections.property("readAlready"), "readAlready");
    }

    private List<Book> createBookList(DetachedCriteria bookListCriteria) {
        Criteria criteria = bookListCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
        criteria.addOrder(Order.asc("b.title")).setProjection(bookProjection).setResultTransformer(Transformers.aliasToBean(Book.class));
        return criteria.list();
    }

    @Transactional
    public List<Book> getBooks() {

        Session session = sessionFactory.getCurrentSession();
        //Transaction tx = session.beginTransaction();

        // 1.
        DetachedCriteria bookListCriteria = DetachedCriteria.forClass(Book.class, "b");
        List<Book> books = createBookList(bookListCriteria);

        // 2.
        List<Book> result = (List<Book>) session.createQuery("from Book").list();

        // 3.
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> query = builder.createQuery(Book.class);
        Root<Book> root = query.from(Book.class);
        query.select(root);

        Query<Book> q = session.createQuery(query);
        List<Book> list = q.getResultList();

        //tx.commit();
        return list;
    }

    private DetachedCriteria createBookCriteria(){
        DetachedCriteria bookListCriteria = DetachedCriteria.forClass(Book.class, "b");
        return bookListCriteria;
    }

    @Transactional
    public List<Book> getBooks(String searchString) {
        String[] params = searchString.split("=");
        List<Book> books = null;

        if(params[0].equals("printYear")) {
            Integer printYear = Integer.parseInt(params[1]);
            books = createBookList(createBookCriteria().add(Restrictions.eq("b." + params[0], printYear)));
        }
        else if(params[0].equals("readAlready")) {
            Byte readAlready = Byte.parseByte(params[1]);
            books = createBookList(createBookCriteria().add(Restrictions.eq("b." + params[0], readAlready)));
        }
        else {
            books = createBookList(createBookCriteria().add(Restrictions.ilike("b." + params[0], params[1], MatchMode.ANYWHERE)));
        }
        return books;
    }
}


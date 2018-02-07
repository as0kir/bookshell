package org.askir.bookshell.service;

import org.apache.log4j.Logger;
import org.askir.bookshell.domain.Book;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.*;
import org.hibernate.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.List;

@Service("bookService")
@Transactional
public class BookService {

    @Resource(name="sessionFactory")
    private SessionFactory sessionFactory;

    //private ProjectionList bookProjection;

    protected static Logger logger = Logger.getLogger("service");

    private List<Book> books;

    private List<Book> createBookList(DetachedCriteria bookListCriteria) {
        Criteria criteria = bookListCriteria.getExecutableCriteria(sessionFactory.getCurrentSession());
        return criteria.list();
    }

    @Transactional
    public List<Book> getBooks() {

        logger.debug("Retrieving all books");

        Session session = sessionFactory.getCurrentSession();
        //Transaction tx = session.beginTransaction();

        // 1.
        /*DetachedCriteria bookListCriteria = DetachedCriteria.forClass(Book.class, "b");
        List<Book> books = createBookList(bookListCriteria);

        // 2.
        List<Book> result = (List<Book>) session.createQuery("from Book").list();
*/
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
    public List<Book> getBooks(String typeSearch, String valueSearch) {

        logger.debug("Retrieving searching books");

        List<Book> books = null;

        String fieldName = "";
        if(typeSearch.equals("Автор"))
            fieldName = "author";

        if(typeSearch.equals("Название"))
            fieldName = "title";

        if(typeSearch.equals("ISBN"))
            fieldName = "isbn";

        if(typeSearch.equals("Описание"))
            fieldName = "description";

        if(typeSearch.equals("Год издания"))
            fieldName = "printYear";

        if(!fieldName.isEmpty()) {
            if (fieldName.equals("printYear")) {
                try {
                    Integer printYear = Integer.parseInt(valueSearch);
                    books = createBookList(createBookCriteria().add(Restrictions.eq("b." + fieldName, printYear)));
                }
                catch (NumberFormatException e) {
                }
            } else if (fieldName.equals("readAlready")) {
                Byte readAlready = Byte.parseByte(valueSearch);
                books = createBookList(createBookCriteria().add(Restrictions.eq("b." + fieldName, readAlready)));
            } else {
                books = createBookList(createBookCriteria().add(Restrictions.ilike("b." + fieldName, valueSearch, MatchMode.ANYWHERE)));
            }
        }

        if(books == null)
            books = new ArrayList<Book>();
        return books;
    }

    public Book get( Integer id ) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        return book;
    }

    public void add(Book book) {
        logger.debug("Adding new book");
        if(book.getAuthor().isEmpty())
            throw new RuntimeException("Не заполнен автор произведения");

        if(book.getTitle().isEmpty())
            throw new RuntimeException("Не заполнено название произведения");

        if(book.getIsbn().isEmpty())
            throw new RuntimeException("Не заполнен ISBN");

        if(book.getDescription().isEmpty())
            throw new RuntimeException("Не заполнено описание произведения");


        Session session = sessionFactory.getCurrentSession();
        session.save(book);
    }


    public void delete(Integer id) {
        logger.debug("Deleting existing book");
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        session.delete(book);
    }

    public void edit(Book book) {
        logger.debug("Editing existing book");
        Session session = sessionFactory.getCurrentSession();

        Book existingBook = (Book) session.get(Book.class, book.getId());
        existingBook.setAuthor(book.getAuthor());
        existingBook.setDescription(book.getDescription());
        existingBook.setIsbn(book.getIsbn());
        existingBook.setPrintYear(book.getPrintYear());
        existingBook.setReadAlready(book.getReadAlready());
        existingBook.setTitle(book.getTitle());

        session.save(existingBook);
    }
}

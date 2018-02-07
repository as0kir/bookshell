package org.askir.bookshell.service;

import org.apache.log4j.Logger;
import org.askir.bookshell.domain.Book;
import org.askir.bookshell.domain.Search;
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
    public List<Book> getBooks(Search search) {

        logger.debug("Retrieving searching books");

        List<Book> books = null;

        if(search.getTypeSearch() == null || search.getTypeSearch().isEmpty() || search.getValueSearch() == null || search.getValueSearch().isEmpty()){
            books = createBookList(createBookCriteria());
        }
        else {
            String fieldName = "";
            if (search.getTypeSearch().equals("Автор"))
                fieldName = "author";

            if (search.getTypeSearch().equals("Название"))
                fieldName = "title";

            if (search.getTypeSearch().equals("ISBN"))
                fieldName = "isbn";

            if (search.getTypeSearch().equals("Описание"))
                fieldName = "description";

            if (search.getTypeSearch().equals("Год издания"))
                fieldName = "printYear";

            if (search.getTypeSearch().equals("Прочитана"))
                fieldName = "readAlready";

            if (!fieldName.isEmpty()) {
                if (fieldName.equals("printYear")) {
                    try {
                        Integer printYear = Integer.parseInt(search.getValueSearch());
                        books = createBookList(createBookCriteria().add(Restrictions.eq("b." + fieldName, printYear)));
                    } catch (NumberFormatException e) {
                    }
                } else if (fieldName.equals("readAlready")) {
                    String valueSearch = search.getValueSearch().toUpperCase();
                    if (valueSearch.equals("ДА") || valueSearch.equals("НЕТ")) {
                        Byte readAlready = (byte) (valueSearch.equals("ДА") ? 1 : 0);
                        books = createBookList(createBookCriteria().add(Restrictions.eq("b." + fieldName, readAlready)));
                    }
                } else {
                    books = createBookList(createBookCriteria().add(Restrictions.ilike("b." + fieldName, search.getValueSearch(), MatchMode.ANYWHERE)));
                }
            }
        }
        if (books == null)
            books = new ArrayList<Book>();

        return books;
    }

    public Book get( Integer id ) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.get(Book.class, id);
        return book;
    }

    public void add(Book book) {
        logger.debug("Adding new book");
        book.setReadAlready((byte)0);

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

        if(book.getTitle().isEmpty())
            throw new RuntimeException("Не заполнено название произведения");

        if(book.getIsbn().isEmpty())
            throw new RuntimeException("Не заполнен ISBN");

        if(book.getDescription().isEmpty())
            throw new RuntimeException("Не заполнено описание произведения");

        if(book.getPrintYear() == null)
            throw new RuntimeException("Не заполнен год измения");

        Book existingBook = (Book) session.get(Book.class, book.getId());
        existingBook.setDescription(book.getDescription());
        existingBook.setIsbn(book.getIsbn());
        existingBook.setPrintYear(book.getPrintYear());
        existingBook.setTitle(book.getTitle());
        book.setReadAlready((byte)0);

        session.save(existingBook);
    }

    public byte editReadAlready(Integer id) {
        logger.debug("Editing readAlready existing book");
        Session session = sessionFactory.getCurrentSession();

        Book book = session.get(Book.class, id);
        byte newValue = (byte)(book.getReadAlready()==1 ? 0 : 1);
        book.setReadAlready(newValue);

        session.save(book);
        return newValue;
    }
}

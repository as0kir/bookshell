package org.askir.bookshell.dao.interfaces;

import org.askir.bookshell.entities.Book;

import java.util.List;

/**
 * Created by user on 03.02.2018.
 */
public interface BookDAO {
    List<Book> getBooks();
    List<Book> getBooks(String searchString);
}

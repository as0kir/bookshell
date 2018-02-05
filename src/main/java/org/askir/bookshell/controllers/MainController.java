package org.askir.bookshell.controllers;

import org.apache.log4j.Logger;
import org.askir.bookshell.dao.impl.BookDaoImpl;
import org.askir.bookshell.entities.Book;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/main")
public class MainController {

    protected static Logger logger = Logger.getLogger("controller");

    @Resource(name="bookService")
    private BookDaoImpl bookService;

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String getBooks(Model model) {
        logger.debug("Received request to show all books");
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        return "bookspage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        logger.debug("Received request to show add page");
        model.addAttribute("bookAttribute", new Book());
        return "addpage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("bookAttribute") Book book) {
        logger.debug("Received request to add new book");
        bookService.add(book);
        return "addedpage";
    }

    @RequestMapping(value = "/books/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to delete existing book");
        bookService.delete(id);
        model.addAttribute("id", id);
        return "deletedpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to show edit page");
        model.addAttribute("bookAttribute", bookService.get(id));
        return "editpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("bookAttribute") Book book, @RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to update book");
        book.setId(id);
        bookService.edit(book);
        model.addAttribute("id", id);
        return "editedpage";
    }
}

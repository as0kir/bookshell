package org.askir.bookshell.controllers;

import org.apache.log4j.Logger;
import org.askir.bookshell.domain.Book;
import org.askir.bookshell.domain.Search;
import org.askir.bookshell.service.BookService;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/main")
public class MainController {

    protected static Logger logger = Logger.getLogger("controller");
    private Search search = new Search();

    @Resource(name="bookService")
    private BookService bookService;

    @RequestMapping(value = "/books", method = RequestMethod.GET)
    public String getBooks(Model model) {
        List<Integer> pages = new ArrayList<Integer>();

        logger.debug("Received request to show all books");
        List<Book> books = bookService.getBooks();
        model.addAttribute("books", books);
        model.addAttribute("searchAttribute", search);

        for (int i = 1; i <= books.size()/10+1; i++) {
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        return "bookspage";
    }

    @RequestMapping(value = "/books/search", method = RequestMethod.POST)
    public String getSearchingBooks(@ModelAttribute("searchAttribute") Search search, Model model) {
        List<Integer> pages = new ArrayList<Integer>();

        logger.debug("Received request to show searching books");
        this.search = search;

        List<Book> books = bookService.getBooks(search);
        model.addAttribute("books", books);
        for (int i = 1; i <= books.size()/10+1; i++) {
            pages.add(i);
        }
        model.addAttribute("pages", pages);
        return "bookspage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.GET)
    public String getAdd(Model model) {
        logger.debug("Received request to show add page");
        model.addAttribute("bookAttribute", new Book());
        model.addAttribute("searchAttribute", search);
        return "addpage";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("bookAttribute") Book book, Model model) {
        logger.debug("Received request to add new book");
        model.addAttribute("searchAttribute", search);
        try {
            bookService.add(book);
            return "addedpage";
        }
        catch (DataIntegrityViolationException e)
        {
            model.addAttribute("error", e.getCause().getCause());
            return "errorpage";
        }
        catch (RuntimeException e)
        {
            model.addAttribute("error", e.getMessage());
            return "errorpage";
        }
    }

    @RequestMapping(value = "/books/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to delete existing book");
        try {
            bookService.delete(id);
        }
        catch (RuntimeException e){

        }
        model.addAttribute("id", id);
        model.addAttribute("searchAttribute", search);
        return "deletedpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.GET)
    public String getEdit(@RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to show edit page");
        model.addAttribute("bookAttribute", bookService.get(id));
        model.addAttribute("searchAttribute", search);
        return "editpage";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String saveEdit(@ModelAttribute("bookAttribute") Book book, @RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to update book");
        book.setId(id);
        bookService.edit(book);
        model.addAttribute("id", id);
        model.addAttribute("searchAttribute", search);
        return "editedpage";
    }

    @RequestMapping(value = "/books/readalready", method = RequestMethod.GET)
    public String getEditReadAlready(@RequestParam(value="id", required=true) Integer id, Model model) {
        logger.debug("Received request to show edit readAlready page");
        byte newValue = bookService.editReadAlready(id);
        model.addAttribute("bookAttribute", bookService.get(id));
        model.addAttribute("searchAttribute", search);
        model.addAttribute("newValue", newValue);
        model.addAttribute("id", id);
        return "readalready";
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleIOException(Exception exception) {
        ModelAndView modelAndView = new ModelAndView("errorpage");
        modelAndView.addObject("error", exception.getMessage());
        modelAndView.addObject("searchAttribute", search);
        return modelAndView;
    }
}

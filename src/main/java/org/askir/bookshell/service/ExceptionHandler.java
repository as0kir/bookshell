package org.askir.bookshell.service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class ExceptionHandler implements HandlerExceptionResolver {

    protected static Logger logger = Logger.getLogger("controller");

    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        ModelAndView modelAndView = new ModelAndView("/books/errorpage");
        modelAndView.addObject("message", e.getMessage());
        //System.out.println("Spring MVC ExceptionHandler handling");
        logger.error("ErrorLog: ", e);
        return modelAndView;
    }
}
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.breaddelivery.springmvc.controller;

/**
 *
 * @author Wouter
 */
import domain.Payment;
import domain.Person;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import service.Service;

@Controller
@RequestMapping(value = "/index")
public class PersonController {
    
    @Autowired
    private Service service;
    
@RequestMapping(method = RequestMethod.GET)
public ModelAndView getOverview(){
    //ModelAndView(<jsppage>,<param-name>,<param-value>);
        Set<Person> allPersons= service.getAllPersons();
        return new  ModelAndView("index2", "persons", allPersons);
    }

/*
  @PreDestroy
  public void cleanup(){
    System.out.println("Cleaning up");
  }
*/

}

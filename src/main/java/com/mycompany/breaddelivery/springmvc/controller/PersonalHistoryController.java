/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.breaddelivery.springmvc.controller;

import domain.Person;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.Service;

@Controller
@RequestMapping(value = "/person")
public class PersonalHistoryController {
    
    @Autowired
    private Service service;

    //@RequestMapping(method = RequestMethod.GET)    
    @RequestMapping(method = RequestMethod.GET, params="personid")
    //public ModelAndView getOverview(){

    public ModelAndView getOverview(@RequestParam("personid") String personid){
        long id = Long.parseLong(personid);
        Set<Person> allPersons= service.getAllPersons();
        ModelAndView model =  new  ModelAndView("history", "person", service.getPerson(id));
        model.addObject("transactions", service.getSortedTransactionsForPerson(id));
        model.addObject("persons", allPersons);
        return model;
    }
    
    @RequestMapping(value="/add", method = RequestMethod.POST)
    public ModelAndView addPerson(@RequestParam("firstname") String firstName,
            @RequestParam("lastname") String lastName){
            service.addPerson(new Person(firstName + " " + lastName));
            return new  ModelAndView("redirect:/index.htm");
    }
    
    }

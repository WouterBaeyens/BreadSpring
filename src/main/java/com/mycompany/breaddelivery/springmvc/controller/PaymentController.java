/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.breaddelivery.springmvc.controller;

import domain.Payment;
import domain.Person;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.Service;

/**
 *
 * @author Wouter
 */

    @Controller
@RequestMapping(value = "/payment")
public class PaymentController {
        
    @Autowired
    private Service service;
    
    @RequestMapping(value="/add/{id}", method = RequestMethod.POST)
    public ModelAndView addPayment(@PathVariable("id") String id, @RequestParam("addPaymentAmount") String amount){
     // public ModelAndView addPayment(@RequestParam("personid") String id){
        
        //ModelAndView(<jsppage>,<param-name>,<param-value>);
        Person person = service.getPerson(id);
        double value = Double.parseDouble(amount);
        Payment payment = new Payment(value, LocalDate.now());
        service.addPersonPayment(person, payment);
        return new  ModelAndView("redirect:/index.htm");
    }
    

}

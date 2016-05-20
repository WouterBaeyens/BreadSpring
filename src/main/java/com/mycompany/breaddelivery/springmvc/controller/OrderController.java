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
import domain.OrderBill;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.Service;

@Controller
@RequestMapping(value = "/order")
public class OrderController {
    
    @Autowired
    private Service service;
        
    @RequestMapping(value="/add", method = RequestMethod.POST)
    public ModelAndView addOrder(
            @RequestParam("date") String date, 
            @RequestParam("amount") String amount, 
            @RequestParam(value= "persons") String[] personIds){
        
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate localDate = LocalDate.parse(date, formatter);
        double value = Double.parseDouble(amount);
        
        OrderBill order = new OrderBill(value, localDate);
        Set<Long> ids = new HashSet<>();
        for(String id: personIds){
            ids.add(Long.parseLong(id));
        }
        
        service.addOrder(ids, order);
        
        //ModelAndView(<jsppage>,<param-name>,<param-value>);
        return new  ModelAndView("redirect:/index.htm");
    }
}

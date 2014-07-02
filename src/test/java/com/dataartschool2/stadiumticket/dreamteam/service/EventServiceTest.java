package com.dataartschool2.stadiumticket.dreamteam.service;

import com.dataartschool2.stadiumticket.dreamteam.dao.EventDAO;
import com.dataartschool2.stadiumticket.dreamteam.domain.Event;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring/root-context.xml"})
@Transactional
public class EventServiceTest{

	@Autowired
    private EventService eventService;

    @Test
    public void readEventTest(){
    	Date date = new Date();
    	Timestamp stamp = new Timestamp(date.getTime());
    	
        Event expected = new Event(15, "1", stamp);    	
    	eventService.updateEvent(expected);
    	
        Event actual = eventService.findById((Integer) 15);        
        Assert.assertEquals(expected, actual);
        Assert.assertNotNull(actual);
    }
    
    @Test
    public void deleteEventTest(){        
    	Date date = new Date();
    	Timestamp stamp = new Timestamp(date.getTime());
    	    	
        Event event = new Event(15, "1", stamp); 	
    	eventService.updateEvent(event);
    	
    	Event actual = eventService.findById((Integer) 15);
    	Assert.assertNotNull(actual);
    	Assert.assertEquals(event, actual);
  
    	eventService.deleteEvent(event);
        actual = eventService.findById((Integer) 15);        
        Assert.assertNull(actual);
    }
    
    @Test
    public void editEventTest(){       
    	Date date = new Date();
    	Timestamp stamp = new Timestamp(date.getTime());
    	
        //new event
    	Event begEvent = new Event(15, "1", stamp);
        Event dbEvent = new Event(15, "1", stamp);
        
        //insert in db
        eventService.updateEvent(dbEvent);
        Event currentEvent = eventService.findById((Integer) 15);    	        
    	Assert.assertNotNull(currentEvent);
    	Assert.assertEquals(dbEvent, currentEvent);  

    	//change event    	
    	stamp.setYear(10);
    	stamp.setMonth(8);
    	stamp.setDate(25);  
    	//eventService
    	dbEvent.setEventDate(stamp);
    	dbEvent.setEventName("testname");
    	eventService.updateEvent(dbEvent);
    	Assert.assertNotSame(dbEvent, begEvent);

    	Event actual = eventService.findById((Integer) 15);
    	Assert.assertEquals(dbEvent, actual);    	
        Assert.assertNotSame(begEvent, actual);
        Assert.assertNotNull(actual);       
    }
    
    @Test
    public void createEventTest(){       
    	Date date = new Date();
    	Timestamp stamp = new Timestamp(date.getTime());
    	
        //new event
    	Event newEvent = new Event(15, "1", stamp);
        eventService.updateEvent(newEvent);                       

        Event currentEvent = eventService.findById((Integer) 15);    	        
    	Assert.assertNotNull(currentEvent);
    	Assert.assertEquals(newEvent, currentEvent);  
    	/*
     	date = new Date();
    	stamp.setTime(date.getTime());
        //recreate event
    	Event editEvent = new Event(15, "2", stamp);
    	eventService.updateEvent(editEvent);
    	Event actual = eventService.findById((Integer) 15); 
    	Assert.assertNotSame(newEvent, actual);
        Assert.assertNotNull(actual);
        */
    }
}
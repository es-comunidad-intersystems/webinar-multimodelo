package com.webinar.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.webinar.persistence.Actor;
import com.webinar.repository.ActorRepository;
import com.webinar.service.ActorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "actorService")
public class ActorServiceImpl implements ActorService {

    @Autowired
    ActorRepository actorRepository;

    @Override
    public List<Actor> recuperaActores() {
        List<Actor> actores = new ArrayList<Actor>();
        try {
            actores = actorRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return actores;
    }
}
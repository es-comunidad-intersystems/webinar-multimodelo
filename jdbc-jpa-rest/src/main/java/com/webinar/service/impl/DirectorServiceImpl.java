package com.webinar.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.webinar.persistence.Director;
import com.webinar.repository.DirectorRepository;
import com.webinar.service.DirectorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "directorService")
public class DirectorServiceImpl implements DirectorService {

    @Autowired
    DirectorRepository directorRepository;

    @Override
    public List<Director> recuperaDirectores() {
        List<Director> directores = new ArrayList<Director>();
        try {
            directores = directorRepository.findAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return directores;
    }
}
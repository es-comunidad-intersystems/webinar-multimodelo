package com.webinar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webinar.persistence.Director;

@Repository
public interface DirectorRepository extends JpaRepository<Director, Long> {

}
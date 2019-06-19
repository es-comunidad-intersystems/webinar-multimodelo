package com.webinar.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.webinar.persistence.Actor;

@Repository
public interface ActorRepository extends JpaRepository<Actor, Long> {

}
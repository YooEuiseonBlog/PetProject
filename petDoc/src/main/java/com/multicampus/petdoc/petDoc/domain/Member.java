package com.multicampus.petdoc.petDoc.domain;

import lombok.Data;
import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
@Data
public class Member{
    @Id
    private String user_id;
    private String user_pwd;
    private String user_name;
    private String user_addr;
    private String user_img;
    private int user_level;
}

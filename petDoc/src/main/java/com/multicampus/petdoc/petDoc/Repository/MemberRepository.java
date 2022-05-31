package com.multicampus.petdoc.petDoc.Repository;

import com.multicampus.petdoc.petDoc.domain.Member;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository extends JpaRepository<com.multicampus.petdoc.petDoc.domain.Member, Long> {

    @Query("select m from Member m where m.user_id = :user_id")
    Member findByUser_Id(@Param("user_id") String user_id);

}


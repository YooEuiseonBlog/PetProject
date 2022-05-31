package com.multicampus.petdoc.petDoc.Service;

import com.multicampus.petdoc.petDoc.Repository.MemberRepository;
import com.multicampus.petdoc.petDoc.domain.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyPageService {
    private final MemberRepository memberRepository;

    public Member getMemberByUserId(String id)
    {
        Member result = memberRepository.findByUser_Id(id);

        return result;
    }

    public void saveMember(Member member)
    {
        memberRepository.save(member);
    }
}

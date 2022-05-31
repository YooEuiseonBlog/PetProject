package com.multicampus.petdoc.petDoc.controller.MyPage;

import com.multicampus.petdoc.petDoc.Service.MyPageService;
import com.multicampus.petdoc.petDoc.domain.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
    private final MyPageService myPageService;

    @GetMapping({"", "/"})
    public String myPage(Model model) {

        //나중에 수정 kyg는 임시로 테스트하기 위해 사용했음
        Member member = myPageService.getMemberByUserId("kgy");
        model.addAttribute("member", member);

        return "thymeleaf/mypage";
    }

    //수정하기
    @PostMapping
    public String memberUpdate(@RequestParam(value = "pwd") String pwd, @RequestParam(value = "addr") String addr, @RequestParam(value = "id")String id)
    {

        Member member = myPageService.getMemberByUserId(id);

        //수정사항 저장
        member.setUser_pwd(pwd);
        member.setUser_addr(addr);

        myPageService.saveMember(member);


         return "redirect:/mypage";
    }
}

package com.multicampus.petdoc.petDoc.controller.AdminPage;

import com.multicampus.petdoc.petDoc.Service.AdminPageService;
import com.multicampus.petdoc.petDoc.domain.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminPageController {
    private final AdminPageService adminPageService;

    @GetMapping({"", "/"})
    public String adminPage(Model model, @PageableDefault(page = 0, size = 20, sort = "user_id") Pageable pageable) {

        List<Member> list = adminPageService.findAll();
        Page<Member> page = new PageImpl<>(list, pageable,list.size());

        int nowPage = page.getPageable().getPageNumber() + 1;
        int startPage = Math.max(nowPage - 2, 1);
        int endPage = Math.min(startPage + 2, page.getTotalPages());

        model.addAttribute("page", page);
        model.addAttribute("nowPage", nowPage);
        model.addAttribute("startPage", startPage);
        model.addAttribute("endPage", endPage);

        return "thymeleaf/admin";
    }

    @PostMapping
    public String memberUpdate(
                               @RequestParam(value = "pwd") String[] pwd, @RequestParam(value = "addr") String[] addr,
                               @RequestParam(value = "id")String[] id, @RequestParam(value ="name")String[] name, @RequestParam(value = "level")int[] level)
    {

        for(int i=0; i<id.length; i++)
        {
            Member member = adminPageService.getMemberByUserId(id[i]);
            member.setUser_name(name[i]);
            member.setUser_pwd(pwd[i]);
            member.setUser_addr(addr[i]);
            member.setUser_level(level[i]);

            adminPageService.saveMember(member);

        }


        return "redirect:/admin";
    }
}

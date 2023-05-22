package com.ecc.ncinside.Controller;

import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/bookmark", method = {RequestMethod.GET,RequestMethod.POST})
public class BookmarkController {

    @Autowired
    BoardService boardService;

    @PostMapping("/cancle")
    public String bookmarkCancle(Integer bno, RedirectAttributes rattr) {
        System.out.println("bno = " + bno);

        try {
            int rowCnt = boardService.deleteBookMark(bno);
            if(rowCnt != 1) {
                throw new Exception("BookMarkCancle is failed");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        rattr.addFlashAttribute("msg", "CANCLE_OK");
        return "redirect:/bookmark/list";
    }

    @GetMapping("/list")
    public String bookmark(HttpSession session, Model m, RedirectAttributes rattr) {
        String loginId = (String) session.getAttribute("id");
        List<Integer> userAddedBkNo = null;
        List<BoardDto> list = null;

        try {
            // SELECT bkno FROM board WHERE id = #{id}
            userAddedBkNo = boardService.usersBookMarkListNo(loginId);
            System.out.println("userAddedBkNo = " + userAddedBkNo);
            list = boardService.bookMarkList(userAddedBkNo);
            System.out.println("BookMarkList = " + list);
            m.addAttribute("userAddedBkno", userAddedBkNo);
            m.addAttribute("bookMarkList", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "bookmark";
    }
}

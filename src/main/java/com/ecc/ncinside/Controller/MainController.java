package com.ecc.ncinside.Controller;

import com.ecc.ncinside.PageHandler;
import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
public class MainController {

    @Autowired
    BoardService boardService;

    @GetMapping("/mypage")
    public String mypage() {
        return "mypage";
    }

    @GetMapping("/result")
    public String result(String keyword, Model m) throws Exception {
        List<String> list = boardService.mainNameList(keyword); // 갤러리 이름 리스트
        List<Integer> typeNoList = boardService.mainTypeNoList(keyword);  // 갤러리 타입넘버 리스트
        List<BoardDto> contentList = boardService.mainContentList(keyword); // 내용만 리스트
        List<Map<Integer, String>> typeList = boardService.getMoreList();  // 다가져오는 리스트

//        for(int i = 0; i < typeNoList.size(); i ++) {
//            System.out.println(typeNoList.get(i));
//        }
//        System.out.println("list = " + list);
//        System.out.println("contentList = " + contentList);
//        System.out.println("keyword = " + keyword);
//        System.out.println("typeList = " + typeList);
        for(BoardDto boardDto : contentList) {
            System.out.println("boardDto = " + boardDto);
            System.out.println(boardDto.getBno());
        }
        m.addAttribute("list", list);
        m.addAttribute("typeList", typeList);
        m.addAttribute("keyword",keyword);
        m.addAttribute("contentList", contentList);
        m.addAttribute("typeNoList", typeNoList);
        return "searchResult";
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String list(@RequestParam(defaultValue = "1") Integer page,
                       @RequestParam(defaultValue = "10") Integer pageSize, Model m, Integer typeNo) throws Exception {

        int totalCnt = boardService.getCountAll();
        m.addAttribute("totalCnt", totalCnt);

        PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);

        List<BoardDto> list = boardService.mainCurrentGetPage();
        m.addAttribute("list", list);
        m.addAttribute("ph", pageHandler);

        Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
        m.addAttribute("startOfToday", startOfToday.toEpochMilli());

        List<BoardDto> itList = boardService.typeSelectPage(1);
        m.addAttribute("itList", itList);
        List<BoardDto> gameList = boardService.typeSelectPage(2);
        m.addAttribute("gameList", gameList);
        List<BoardDto> funnyList = boardService.typeSelectPage(3);
        m.addAttribute("funnyList", funnyList);
        List<BoardDto> foodList = boardService.typeSelectPage(4);
        m.addAttribute("foodList", foodList);

        List<BoardDto> bestTop10 = boardService.best10Page();
        m.addAttribute("bestTop10",bestTop10);

        List<Map<Integer, String>> typeList = boardService.getMoreList();
        m.addAttribute("typeList", typeList);

        return "index";
    }
}

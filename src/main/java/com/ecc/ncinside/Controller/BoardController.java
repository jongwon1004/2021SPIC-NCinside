package com.ecc.ncinside.Controller;

import com.ecc.ncinside.PageHandlerSc;
import com.ecc.ncinside.domain.BoardDto;
import com.ecc.ncinside.domain.SearchCondition;
import com.ecc.ncinside.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpSession;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/board")
public class BoardController {

    final BoardService boardService;

    public BoardController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping("/addBookMark")
    public String addBookMark(BoardDto boardDto, SearchCondition sc, HttpSession session, Model m, Integer bno, RedirectAttributes rattr) {
        String loginId = (String) session.getAttribute("id");
        System.out.println("loginId = " + loginId);
        try {
            int rowCnt = boardService.addBookMark(loginId, boardDto);
            if(rowCnt != 1)
                throw new Exception("addBookMark is failed");
//            rattr.addFlashAttribute("msg", "BKADD_OK");
        } catch (Exception e) {
            e.printStackTrace();
//            rattr.addFlashAttribute("msg", "BKADD_NOT");
        }
        m.addAttribute(boardDto);

        return "redirect:/board/read"+sc.getQueryString()+"&bno="+bno;
    }

    @PostMapping("/modify")
    public String modify(BoardDto boardDto, SearchCondition sc, Model m, RedirectAttributes rattr, HttpSession session) {
        String writer = (String) session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt = boardService.modify(boardDto);
            if(rowCnt != 1)
                throw new Exception("Modify failed");


            rattr.addFlashAttribute("msg", "MOD_OK");

            return "redirect:/board/list"+sc.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "MOD_ERR");
            return "board";
        }
    }

    @PostMapping("/write")
    public String write(BoardDto boardDto, Model m, HttpSession session, Integer typeNo, RedirectAttributes rattr) {
        String writer = (String) session.getAttribute("id");
        boardDto.setWriter(writer);
        boardDto.setType_no(typeNo);

        try {
            int rowCnt = boardService.write(boardDto);

            if(rowCnt != 1)
                throw new Exception("Write failed");

            rattr.addFlashAttribute("msg", "WRT_OK");
            m.addAttribute(boardDto);
            return "redirect:/board/list?typeNo="+typeNo;
        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute(boardDto);
            m.addAttribute("msg", "WRT_ERR");
            return "board";
        }
    }

    @GetMapping("/write")
    public String write(Model m, Integer typeNo, BoardDto boardDto) {
        boardDto.setBno(0);
        m.addAttribute("mode", "new");
        m.addAttribute("typeNo", typeNo);
        m.addAttribute("boardDto",boardDto);
        System.out.println("typeNo = " + typeNo);

        return "board";
    }

    @PostMapping("/remove")
    public String remove(Integer bno, Integer page, Integer pageSize, Model m, HttpSession session, RedirectAttributes rattr, Integer typeNo) {
        String writer = (String) session.getAttribute("id");
        String msg = "DEL_OK";

        try {

            int rowCnt = boardService.remove(bno, writer);
            if(rowCnt != 1)
                throw new Exception("board remove error");

        } catch (Exception e) {
            e.printStackTrace();
            msg = "DEL_ERR";
        }

        rattr.addAttribute("page", page);
        rattr.addAttribute("pageSize", pageSize);
        rattr.addAttribute("typeNo", typeNo);   // rattr.addAttribute줘야함 (중요) Flash아님
        rattr.addFlashAttribute("msg", msg);
        return "redirect:/board/list";
    }

    @GetMapping("/read")
    public String read(Integer bno, SearchCondition sc, Model m, Integer typeNo, String Added) {
        try {
            BoardDto boardDto = boardService.read(bno);
            boardDto.setType_no(typeNo);
            m.addAttribute(boardDto);
            m.addAttribute("ADDED", Added);
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "board";
    }

    @GetMapping("/list")
    public String list(SearchCondition sc, Model m, Integer typeNo) {
        String typeName = null;
        try {
            System.out.println("typeNo = " + typeNo);
            System.out.println("sc = " + sc);
//            int totalCnt = boardService.getCount(typeNo);
            typeName = boardService.typeName(typeNo);
            int totalCnt = boardService.getSearchResultCnt(sc);
            if(totalCnt < 1)
                totalCnt = 10;
            System.out.println("totalCnt = " + totalCnt);
            m.addAttribute("totalCnt", totalCnt);

            PageHandlerSc pageHandler = new PageHandlerSc(totalCnt, sc);

//            List<BoardDto> list = boardService.getPage(map);
            List<BoardDto> list = boardService.getSearchResultPage(sc);
            m.addAttribute("list", list);
            m.addAttribute("ph", pageHandler);
            m.addAttribute("typeNo", typeNo);
            m.addAttribute("typeName", typeName);

            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
            m.addAttribute("startOfToday", startOfToday.toEpochMilli());

        } catch (Exception e) {
            e.printStackTrace();
            m.addAttribute("typeNo", typeNo);
            m.addAttribute("typeName", typeName);
            m.addAttribute("msg", "NOT_FOUND_RESULT");

        }
        return "boardList";
    }

    @GetMapping("/moreList")
    public String moreList(Model m) {
        List<Map<Integer, String>> list = new ArrayList<>();
//        List<Object> stringList = new ArrayList<>();

        try {
            list = boardService.getMoreList();
//            for(int i = 0; i < list.size(); i++) {
//                stringList.add(list.get(i).get("type_name"));
//                System.out.println(list.get(i).get("type_name"));
//            }
//            System.out.println("stringList = " + stringList);
//            System.out.println("list.get(1).keySet() = " + list.get(1).get("type_name"));
//            System.out.println("list = " + list);
            m.addAttribute("moreList", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "moreList";
    }

//    for (Map.Entry<String, Object> entry : testMap.entrySet())
//    {
//        System.out.println("key : " + entry.getKey() + " / " + "value : " + entry.getValue());
//    }

}

//    @GetMapping("/list")
//    public String list(@RequestParam(defaultValue ="1") Integer page,
//                       @RequestParam(defaultValue = "10") Integer pageSize, Model m, Integer typeNo) {
//
//        try {
//            int totalCnt = boardService.getCount(typeNo);
//            String typeName = boardService.typeName(typeNo);
//            System.out.println("totalCnt = " + totalCnt);
//            m.addAttribute("totalCnt", totalCnt);
//
//            PageHandler pageHandler = new PageHandler(totalCnt, page, pageSize);
//
//            if(page < 0 || page > pageHandler.getTotalPage())
//                page = 1;
//            if(pageSize < 0 || pageSize > 50)
//                pageSize = 10;
//
//            Map map = new HashMap();
//            map.put("offset", (page-1)*pageSize);
//            map.put("typeNo", typeNo);
//
//            List<BoardDto> list = boardService.getPage(map);
//            m.addAttribute("list", list);
//            m.addAttribute("ph", pageHandler);
//            m.addAttribute("page", page);
//            m.addAttribute("pageSize", pageSize);
//            m.addAttribute("typeNo", typeNo);
//            m.addAttribute("typeName", typeName);
//
//            Instant startOfToday = LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant();
//            m.addAttribute("startOfToday", startOfToday.toEpochMilli());
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return "boardList"; // 로그인을 한 상태이면, 게시판 화면으로 이동
//    }

package com.ecc.ncinside.Controller;

import com.ecc.ncinside.domain.CommentDto;
import com.ecc.ncinside.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

//@Controller
//@ResponseBody  // 메서드 하나하나에 붙혀도 되고 클래스 안의 전체 메서드에 쓸때 클래스에 적어도됨.
// @Controller + @ResponseBody 두개를 합친것이 @RestController임
@RestController
public class CommentController {
    @Autowired
    CommentService service;

//    {
//        "pcno":0,
//            "comment":"hello mod",
//            "commenter" : "qwer"
//    }

    @PatchMapping("/comments/{cno}")  // /nc/comments/70 PATCH
    @ResponseBody public ResponseEntity<String> modify(@PathVariable Integer cno, @RequestBody CommentDto dto, HttpSession session) {
//        String commenter = (String) session.getAttribute("id");
        dto.setCommenter((String) session.getAttribute("id"));
        dto.setCno(cno);
        System.out.println("dto = " + dto);

        try {
            if(service.modify(dto) != 1)
                throw new Exception("Modify Failed");

            return new ResponseEntity<>("MOD_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("MOD_ERR", HttpStatus.BAD_REQUEST);
        }
    }

//    {
//        "pcno":0,
//            "comment":"hi"
//    }

    @PostMapping("/comments")                   // @RequestBody 가 있어야 json으로 온걸 자바 객체로 반환해서 넣어줌
    @ResponseBody public ResponseEntity<String> write(@RequestBody CommentDto dto, Integer bno, HttpSession session) {
//        String commenter = (String) session.getAttribute("id");
        dto.setCommenter((String) session.getAttribute("id"));
        dto.setBno(bno);
        System.out.println("dto = " + dto);

        try {
            if(service.write(dto) != 1)
                throw new Exception("Write Failed");

            return new ResponseEntity<>("WRT_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("WRT_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @DeleteMapping("/comments/{cno}")  // comments/삭제할 댓글 번호
    @ResponseBody public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session) {
        String commenter = (String) session.getAttribute("id");
        try {
            int rowCnt = service.remove(cno, bno, commenter);
            if(rowCnt != 1)
                throw new Exception("Delte Failed");

            return new ResponseEntity<>("DEL_OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("DEL_ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/comments") // /comments?bno=1210  GET
    @ResponseBody public ResponseEntity<List<CommentDto>> list(Integer bno) {
        List<CommentDto> list = null;

        try {
            list = service.getList(bno);
            return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);  // 200
            // ResponseEntity라는게 별게아니고 list가 Entity인데 Entitiy에 상태코드를 추가한 것 뿐임
            // 원래는 Entity만 보냈었는데 거기에 상태코드까지 같이 보내주면 스프링이 알아서 처리해줌
            // 응답이나 요청을 할때 전송할 대상을 Entitiy라고 함 (택배) Response Entity , Request Entity
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<List<CommentDto>>(HttpStatus.BAD_REQUEST); // 400
        }
    }
}

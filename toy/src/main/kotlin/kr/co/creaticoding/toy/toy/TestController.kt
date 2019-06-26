package kr.co.creaticoding.toy.toy

import org.springframework.web.bind.annotation.RestController
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestMapping

@Controller
@RequestMapping("/my")
class TestController {

  @GetMapping
  fun blog(): String {
    return "my/index"
  }

  @GetMapping("/xlsx")
  fun blog2(): String {
    return "my/xlsx"
  }

}
package com.mobile.mobile.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.mobile.mobile.dao.accessoryDao;
import com.mobile.mobile.dao.mobileDao;
import com.mobile.mobile.entity.accessories;
import com.mobile.mobile.entity.brand;
import com.mobile.mobile.entity.mobiles;


@Controller
public class MobileController
{
    @Autowired
    private mobileDao mobiledao;
    @Autowired
    private accessoryDao accdao;

    @RequestMapping(value= "mobiles", method = RequestMethod.GET)
    public String mobilehome(HttpSession session, Model model)
    {
        List<mobiles> list = mobiledao.getMobiles("","","","", false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "mobile";
    }
    @RequestMapping(value= "mobiles", method = RequestMethod.POST)
    public String mobilehomep(HttpSession session, Model model, @RequestParam("model") String modell, @RequestParam("brandd") String brandd, @RequestParam("name") String name, @RequestParam("sortby") String sortyby)
    {
        List<mobiles> list = mobiledao.getMobiles(modell,brandd,name,sortyby, false);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("list", list);
        model.addAttribute("brands", brands);
        model.addAttribute("model_val", modell);
        model.addAttribute("brand_val", brandd);
        model.addAttribute("name_val", name);
        return "mobile";
    }
    @RequestMapping(value= "mobiles/compare", method = RequestMethod.GET)
    public String compare(HttpSession session, Model model)
    {

        return "compare";
    }
    @RequestMapping(value= "accessory", method = RequestMethod.GET)
    public String accessoryhome(HttpSession session, Model model)
    {
        List<accessories> list = accdao.getAccessories("","","","");
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "accessory";
    }
    @RequestMapping(value= "accessory", method = RequestMethod.POST)
    public String accessoryhome(HttpSession session, Model model, @RequestParam("model") String modell, @RequestParam("brand") String brand, @RequestParam("name") String name, @RequestParam("type") String type)
    {
        List<accessories> list = accdao.getAccessories(modell,name,type,brand);
        List<brand> brands = mobiledao.getAllBrands();
        model.addAttribute("brands", brands);
        model.addAttribute("list", list);
        return "accessory";
    }
}



package com.letion.controllers;

import com.letion.dao.StorageRepositories;
import com.letion.model.OrderList;
import com.letion.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {

    @Autowired
    private StorageRepositories session;

    @RequestMapping(value = {"/*", "/", "/index.html", "/index"}, method = RequestMethod.GET)
    public ModelAndView start() throws SQLException, ClassNotFoundException {
        List<Product> productFary = (List<Product>) session.getRepository().getByTypeUrl("fonari-zadnie");
        ModelAndView modelAndView = new ModelAndView("index", "product", productFary);
        return modelAndView;
    }

    @RequestMapping(value = "/product/{url}", method = RequestMethod.GET)
    public ModelAndView printProduct(@PathVariable("url") String url) throws SQLException, ClassNotFoundException {
        Product product = (Product) session.getRepository().getByIdUrl(url);
        ModelAndView modelAndView = new ModelAndView("product", "product", product);
        return modelAndView;
    }

    @RequestMapping(value = "/all/{typeUrl}", method = RequestMethod.GET)
    public ModelAndView printAllByTypeUrl(@PathVariable("typeUrl") String typeUrl) throws SQLException, ClassNotFoundException {
        List<Product> products = (List<Product>) session.getRepository().getByTypeUrl(typeUrl);
        ModelAndView modelAndView = new ModelAndView("listByType", "products", products);
        return modelAndView;
    }

    @RequestMapping(value = "/product/order", method = RequestMethod.GET)
    public ModelAndView order() throws SQLException, ClassNotFoundException {
        ModelAndView model = new ModelAndView();
        model.setViewName("/order");
        return model;
    }

    @RequestMapping(value = "/product/checkout", method = RequestMethod.POST)
    public @ResponseBody
    ResponseEntity checkout(@RequestBody List<OrderList> orders) throws SQLException, ClassNotFoundException {
        for (int i = 0; i < orders.size(); i++){
            session.getRepository().saveCart(orders.get(i));
        }
        HttpHeaders headers = new HttpHeaders();
        return new ResponseEntity<Void>(headers, HttpStatus.OK);
    }

    @RequestMapping(value = "/checkout/success", method = RequestMethod.GET)
    public ModelAndView checkoutSuccess() throws SQLException, ClassNotFoundException {
        ModelAndView model = new ModelAndView();
        model.setViewName("/checkout");
        return model;
    }


    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(
            @RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout
    ) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username and password!");
        }
        if (logout != null) {
            model.addObject("msg", "You've been logged out successfully.");
        }
        model.setViewName("/login");
        return model;
    }

    @RequestMapping(value = {"/adminka", "/adminka/*"}, method = RequestMethod.GET)
    public ModelAndView adminkaStart() throws SQLException, ClassNotFoundException {
        ModelAndView model = new ModelAndView();
        model.setViewName("adminka/welcome");
        return model;
    }

    @RequestMapping(value = "/adminka/dashboard", method = RequestMethod.GET)
    public ModelAndView adminkaDashboard() throws SQLException, ClassNotFoundException {
        ModelAndView model = new ModelAndView();
        model.setViewName("adminka/dashboard");
        return model;
    }

    @RequestMapping(value = "/adminka/show-all/{typeUrl}", method = RequestMethod.GET)
    public ModelAndView adminkaGetAllByTypeProduct(@PathVariable("typeUrl") String typeUrl) throws SQLException, ClassNotFoundException {
        List<Product> products = (List<Product>) session.getRepository().getByTypeUrl(typeUrl);
        ModelAndView modelAndView = new ModelAndView("adminka/show-all", "products", products);
        return modelAndView;
    }

    @RequestMapping(value = {"/adminka/show-all", "/adminka/show-all/"}, method = RequestMethod.GET)
    public ModelAndView adminkaGetAllProduct(@PathVariable("typeUrl") String typeUrl) throws SQLException, ClassNotFoundException {
        typeUrl = "fary";
        List<Product> products = (List<Product>) session.getRepository().getByTypeUrl(typeUrl);
        ModelAndView modelAndView = new ModelAndView("adminka/show-all", "products", products);
        return modelAndView;
    }

    @RequestMapping(value = "/adminka/product/{url}", method = RequestMethod.GET)
    public ModelAndView adminkaShowProduct(@PathVariable("url") String url) throws SQLException, ClassNotFoundException {
        Product product = (Product) session.getRepository().getByIdUrl(url);
        ModelAndView modelAndView = new ModelAndView("adminka/update", "product", product);
        Map<String, Map> map = session.getRepository().getSelects();
        modelAndView.addObject("selectManufacturer", map.get("selectManufacturer"));
        modelAndView.addObject("selectType", map.get("selectType"));
        modelAndView.addObject("selectAvailability", map.get("selectAvailability"));
        modelAndView.addObject("selectBrandAuto", map.get("selectBrandAuto"));
        modelAndView.addObject("selectPriceForQ", map.get("selectPriceForQ"));
        modelAndView.addObject("url", url);
        return modelAndView;
    }

    @RequestMapping(value = "/adminka/update", method = RequestMethod.POST)
    public String adminkaUpdate(@ModelAttribute("product") Product product) throws SQLException, ClassNotFoundException {
        session.getRepository().update(product);
        return "redirect:/adminka/product/" + product.getUrl();
    }

    @RequestMapping(value = "/adminka/new_product", method = RequestMethod.GET)
    public ModelAndView adminkaNewProductForm() throws SQLException, ClassNotFoundException {
        Product product = new Product();
        ModelAndView modelAndView = new ModelAndView("adminka/new_product", "product", product);
        Map<String, Map> map = session.getRepository().getSelects();
        modelAndView.addObject("selectManufacturer", map.get("selectManufacturer"));
        modelAndView.addObject("selectType", map.get("selectType"));
        modelAndView.addObject("selectAvailability", map.get("selectAvailability"));
        modelAndView.addObject("selectBrandAuto", map.get("selectBrandAuto"));
        modelAndView.addObject("selectPriceForQ", map.get("selectPriceForQ"));
        return modelAndView;
    }

    @RequestMapping(value = "/adminka/add", method = RequestMethod.POST)
    public String adminkaAdd(@ModelAttribute("product") Product product) throws SQLException, ClassNotFoundException {
        session.getRepository().save(product);
        return "redirect:/adminka/dashboard";
    }

}

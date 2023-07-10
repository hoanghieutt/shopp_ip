package com.demo.controller;

import com.demo.model.Product;
import com.demo.service.AccountService;
import com.demo.service.CartService;
import com.demo.service.CategoryService;
import com.demo.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Controller
public class UserController {

    @Autowired
    HttpSession session;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ProductService productService;

    @Autowired
    AccountService accountService;

    @Autowired
    CartService cart;

    @ModelAttribute("cart")
    CartService getCart() {
        return cart;
    }

    @Data
    @AllArgsConstructor
    public static class PriceRange {
        int id;
        int minValue;
        int maxValue;
        String display;
    }

    List<PriceRange> priceRangeList = Arrays.asList(
            new PriceRange(0, 0, Integer.MAX_VALUE, "Tất cả"),
            new PriceRange(1, 0, 10000000, "Dưới 10 triệu"),
            new PriceRange(2, 10000000, 20000000, "Từ 10-20 triệu"),
            new PriceRange(3, 20000000, Integer.MAX_VALUE, "Trên 20 triệu")
    );

    @RequestMapping("/")
    public String index(Model model,
                        @RequestParam(defaultValue = "") String keyword,
                        @RequestParam(defaultValue = "") String categoryId,
                        @RequestParam(defaultValue = "0") int priceRangeId,
                        @RequestParam(defaultValue = "0") int page) {
        if (session.getAttribute("username") == null) {
            return "redirect:/login";
        }
        int minPrice = priceRangeList.get(priceRangeId).minValue;
        int maxPrice = priceRangeList.get(priceRangeId).maxValue;
        model.addAttribute("priceRangeList", priceRangeList);
        model.addAttribute("categoryList", categoryService.getAll());
        model.addAttribute("productPage", productService.findAllProductBy(keyword, categoryId, minPrice, maxPrice, page));

        System.out.println("keyword=" + keyword);
        System.out.println("categoryId=" + categoryId);
        System.out.println("minPrice=" + minPrice);
        System.out.println("maxPrice=" + maxPrice);
        System.out.println("page=" + page);

        return "home/index";
    }

    @GetMapping("/detail/{id}")
    public String viewProduct(@PathVariable("id") String id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        return "home/detail";
    }

    @RequestMapping("/add-to-cart/{id}")
    public String addToCart(@PathVariable String id) {
        cart.add(id);
        return "redirect:/cart";
    }

    @RequestMapping("/remove-cart/{id}")
    public String removeCart(@PathVariable String id) {
        cart.remove(id);
        if (cart.getTotal() == 0) {
            return "redirect:/";
        }
        return "redirect:/cart";
    }

    @RequestMapping("/update-cart/{id}")
    public String updateCart(@PathVariable String id, int quantity) {
        cart.update(id, quantity);
        return "redirect:/cart";
    }

    @GetMapping("/cart")
    public String cart() {
        return "home/cart";
    }

    @GetMapping("/confirm")
    public String confirm() {
        return "home/confirm";
    }

    @RequestMapping("/about")
    public String about(Model model) {
        return "home/about";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam Optional<String> username, @RequestParam Optional<String> password, Model model) {
        if (accountService.login(username.orElse(""), password.orElse(""))) {
            session.setAttribute("username", username.get());
            return "redirect:/";
        }
        model.addAttribute("message", "Tên đăng nhập/mật khẩu không đúng");
        return "login";
    }

    @PostMapping("/purchase")
    public String purchase(@RequestParam String address) {
        System.out.println("address=" + address);
        System.out.println("items=" + cart.getItems());
        // TODO: Save items to database
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout() {
        session.removeAttribute("username");
        return "redirect:/login";
    }
}

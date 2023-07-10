package com.demo.controller;

import com.demo.model.Account;
import com.demo.model.Category;
import com.demo.model.Product;
import com.demo.service.AccountService;
import com.demo.service.CategoryService;
import com.demo.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;

@Controller
public class AdminController {

    @Autowired
    ProductService productService;
    @Autowired
    CategoryService categoryService;

    @Autowired
    AccountService accountService;

    //  Category
    @GetMapping("/admin/category/index")
    public String listCategory(Model model) {
        model.addAttribute("category", new Category());
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/category/list";
    }

    @PostMapping("/admin/category/create")
    public String createCategory(@RequestParam(defaultValue = "unknown") String name, Model model) {
        categoryService.save(new Category(), name);
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/category/list";
    }

    @PostMapping("/admin/category/edit/{id}")
    public String editCategory(@PathVariable String id, @RequestParam String name, Model model) {
        categoryService.save(categoryService.findByid(id), name);
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/category/list";
    }

    //  Product
    @GetMapping("/admin/product/index")
    public String listProduct(Model model) {
        model.addAttribute("product", new Product());
        model.addAttribute("productList", productService.getAll());
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/product/list";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(@Valid @ModelAttribute Product product, BindingResult result,
                                @RequestParam MultipartFile fileImage, Model model) throws IOException {
        if (!result.hasErrors()) {
            productService.save(product, fileImage);
        }
        model.addAttribute("productList", productService.getAll());
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/product/list";
    }

    @PostMapping("/admin/product/update")
    public String updateProduct(@Valid @ModelAttribute Product product,
                                BindingResult result,
                                @RequestParam MultipartFile fileImage,
                                Model model) throws IOException {
        if (result.hasErrors()) {
            model.addAttribute("categoryList", categoryService.getAll());
            return "admin/product/form";
        }
        productService.save(product, fileImage);
        return "redirect:/admin/product/index";
    }

    @GetMapping("/admin/product/edit/{id}")
    public String editProduct(@PathVariable String id, Model model) {
        Product product = productService.findById(id);
        model.addAttribute("product", product);
        model.addAttribute("categoryList", categoryService.getAll());
        return "admin/product/form";
    }

    //  Account
    @GetMapping("/admin/account/index")
    public String listAccount(Model model) {
        model.addAttribute("account", new Account());
        model.addAttribute("accountList", accountService.getAll());
        return "admin/account/list";
    }

    @PostMapping("/admin/account/create")
    public String createAccount(@Valid @ModelAttribute Account account,
                                BindingResult result, Model model,
                                @RequestParam MultipartFile fileImage) throws IOException {
        if (!result.hasErrors()) {
            accountService.save(account, fileImage);
        }
        model.addAttribute("accountList", accountService.getAll());
        return "admin/account/list";
    }

    @PostMapping("/admin/account/update")
    public String updateAccount(@Valid @ModelAttribute Account account,
                                BindingResult result, Model model,
                                @RequestParam MultipartFile fileImage) throws IOException {
        if (result.hasErrors()) {
            return "admin/account/form";
        }
        accountService.save(account, fileImage);
        return "redirect:/admin/account/index";
    }

    @GetMapping("/admin/account/edit/{id}")
    public String editAccount(@PathVariable String id, Model model) {
        Account account = accountService.findById(id);
        model.addAttribute("account", account);
        return "admin/account/form";
    }


}

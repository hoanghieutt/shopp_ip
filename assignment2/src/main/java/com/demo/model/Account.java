package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "Accounts")
@AllArgsConstructor
@NoArgsConstructor
public class Account implements Serializable {
    @Id
    @Column(name = "username")
    @NotBlank
    String userName;
    @Column(name = "password")
    @NotBlank
    String passWord;
    @Column(name = "fullname")
    @NotBlank
    String fullName;
    @NotBlank
    @Email
    String email;
    String photo;
    boolean activated;
    boolean admin;
    @OneToMany(mappedBy = "account", fetch = FetchType.LAZY)
    List<Order> orders;
}

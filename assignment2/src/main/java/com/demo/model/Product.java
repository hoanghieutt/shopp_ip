package com.demo.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "Products")
@AllArgsConstructor
@NoArgsConstructor
public class Product implements Serializable {
    @Id
    @GenericGenerator(name = "auto", strategy = "guid")
    @GeneratedValue(generator = "auto")
    String id;

    @NotBlank
    String name;

    String image;

    @NotNull
    Integer price;

    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    Date createDate = new Date();

    Boolean available;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "categoryid")
    @JsonIgnore
    Category category;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    @JsonIgnore
    List<OrderDetail> orderDetails;
}

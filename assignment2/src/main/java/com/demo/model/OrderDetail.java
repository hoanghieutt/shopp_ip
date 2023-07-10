package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Data
@AllArgsConstructor
@Entity
@Table(name = "OderDetails")
@NoArgsConstructor
public class OrderDetail implements Serializable {

    @Id
    @GenericGenerator(name = "auto", strategy = "guid")
    @GeneratedValue(generator = "auto")
    String id;
    Integer price;
    Integer quantity;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "Productid")
    Product product;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "Orderid")
    Order order;
}

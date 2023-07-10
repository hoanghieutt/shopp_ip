package com.demo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
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
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "Orders")
@AllArgsConstructor
@NoArgsConstructor
public class Order implements Serializable {
    @Id
    @GenericGenerator(name = "auto", strategy = "guid")
    @GeneratedValue(generator = "auto")
    String id;
    String address;
    @Temporal(TemporalType.DATE)
    @Column(name = "createdate")
    Date createDate = new Date();
    @ManyToOne
    @JoinColumn(name = "Username")
    Account account;
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY)
    List<OrderDetail> orderDetails;
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lbu.helpinghands.entity;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author zak
 */
@Entity
@Table(name = "mailing_address_table")
@NamedQueries({
    @NamedQuery(name = "MailAddress.findAll", query = "SELECT m FROM MailAddress m")})
public class MailAddress implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "mail_address_id")
    private Integer mailAddressId;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "email")
    private String email;

    public MailAddress() {
    }

    public MailAddress(Integer mailAddressId) {
        this.mailAddressId = mailAddressId;
    }

    public MailAddress(Integer mailAddressId, String email) {
        this.mailAddressId = mailAddressId;
        this.email = email;
    }

    public Integer getMailAddressId() {
        return mailAddressId;
    }

    public void setMailAddressId(Integer mailAddressId) {
        this.mailAddressId = mailAddressId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (mailAddressId != null ? mailAddressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MailAddress)) {
            return false;
        }
        MailAddress other = (MailAddress) object;
        if ((this.mailAddressId == null && other.mailAddressId != null) || (this.mailAddressId != null && !this.mailAddressId.equals(other.mailAddressId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.lbu.helpinghands.entity.MailAddress[ mailAddressId=" + mailAddressId + " ]";
    }
    
}

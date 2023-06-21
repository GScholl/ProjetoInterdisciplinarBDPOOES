/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

/**
 *
 * @author PC-02
 */
public class Cupom {
    private int id;
    private String codigoCupom;
    private double valorDesconto;
    private String tipoDesconto;
    private String LegendaDesconto;

    public String getLegendaDesconto() {
        return LegendaDesconto;
    }

    public void setLegendaDesconto(String LegendaDesconto) {
        this.LegendaDesconto = LegendaDesconto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCodigoCupom() {
        return codigoCupom;
    }

    public void setCodigoCupom(String codigoCupom) {
        this.codigoCupom = codigoCupom;
    }

    public double getValorDesconto() {
        return valorDesconto;
    }

    public void setValorDesconto(double valorDesconto) {
        this.valorDesconto = valorDesconto;
    }

    public String getTipoDesconto() {
        return tipoDesconto;
    }

    public void setTipoDesconto(String tipoDesconto) {
        this.tipoDesconto = tipoDesconto;
    }
    
    
}

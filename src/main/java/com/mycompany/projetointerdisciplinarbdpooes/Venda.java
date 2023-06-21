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
public class Venda {

    private int id;
    private double valorLiquido;
    private double valorBruto;
    private int id_cupom;
    private String CodigoCupom;
    private String NomeUsuario;
    private int idUsuario;
    private String nomeCliente;
    private int idCliente;
    private String formaPagamento;
    private String dataCompra;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getValorLiquido() {
        return valorLiquido;
    }

    public void setValorLiquido(double valorLiquido) {
        this.valorLiquido = valorLiquido;
    }

    public double getValorBruto() {
        return valorBruto;
    }

    public void setValorBruto(double valorBruto) {
        this.valorBruto = valorBruto;
    }

    public int getId_cupom() {
        return id_cupom;
    }

    public void setId_cupom(int id_cupom) {
        this.id_cupom = id_cupom;
    }

    public String getCodigoCupom() {
        return CodigoCupom;
    }

    public void setCodigoCupom(String CodigoCupom) {
        this.CodigoCupom = CodigoCupom;
    }

    public String getNomeUsuario() {
        return NomeUsuario;
    }

    public void setNomeUsuario(String NomeUsuario) {
        this.NomeUsuario = NomeUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNomeCliente() {
        return nomeCliente;
    }

    public void setNomeCliente(String nomeCliente) {
        this.nomeCliente = nomeCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getFormaPagamento() {
        return formaPagamento;
    }

    public void setFormaPagamento(String formaPagamento) {
        this.formaPagamento = formaPagamento;
    }

    public String getDataCompra() {
        return dataCompra;
    }

    public void setDataCompra(String dataCompra) {
        this.dataCompra = dataCompra;
    }

    public String getFormaPagamentoFormatado(String formaPagamento) {
        if (formaPagamento.equalsIgnoreCase("C")) {
            return "Crédito";
        } else if (formaPagamento.equalsIgnoreCase("D")) {
            return "Débito";
        } else if (formaPagamento.equalsIgnoreCase("P")) {
            return "Pix";
        } else if (formaPagamento.equalsIgnoreCase("DV")) {
            return "Dinheiro";
        } else {
            return "Indefinido";
        }

    }
}
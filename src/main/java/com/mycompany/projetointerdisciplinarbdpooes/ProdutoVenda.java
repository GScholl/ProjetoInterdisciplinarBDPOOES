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
public class ProdutoVenda {

    private int id;
    private int id_produto;
    private int id_venda;
    private String alias_nome_produto;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_produto() {
        return id_produto;
    }

    public void setId_produto(int id_produto) {
        this.id_produto = id_produto;
    }

    public int getId_venda() {
        return id_venda;
    }

    public void setId_venda(int id_venda) {
        this.id_venda = id_venda;
    }

    public String getAlias_nome_produto() {
        return alias_nome_produto;
    }

    public void setAlias_nome_produto(String alias_nome_produto) {
        this.alias_nome_produto = alias_nome_produto;
    }

}

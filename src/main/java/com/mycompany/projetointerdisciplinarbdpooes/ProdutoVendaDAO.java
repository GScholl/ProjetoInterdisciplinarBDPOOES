/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author PC-02
 */
public class ProdutoVendaDAO {
     private final String INSERT = "INSERT INTO produtos_venda (id_venda,id_produto) VALUES(?,?)";
 
     public Resposta inserirProdutoVenda(ProdutoVenda produto_venda) {

        if (produto_venda != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(INSERT);
                pstm.setInt(1, produto_venda.getId_venda());
                pstm.setInt(2, produto_venda.getId_produto());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
                Resposta resposta = new Resposta(false, 200, "Produto Cadastrado com sucesso!");
                return resposta;

            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao inserir o produto");
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "Dados invalidos para inserção");
            return resposta;
        }

    }
}

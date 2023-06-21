/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author PC-02
 */
public class ProdutoDAO {

    private final String INSERT = "INSERT INTO produto (nome_produto,valor) VALUES(?,?)";
    private final String UPDATE = "UPDATE produto SET nome_produto=?, valor=? WHERE id=?";
    private final String DELETE = "DELETE FROM produto WHERE id=?";
    private final String LIST = "SELECT * FROM produto";
    private final String LISTBYID = "SELECT * FROM produto WHERE id=?";
    private final String LISTBYVENDA = "SELECT produto.id,COUNT(produto.id) as qtd, sum(produto.valor) as valor_total, produto.valor, produto.nome_produto FROM produto INNER JOIN produtos_venda ON (produtos_venda.id_produto = produto.id) WHERE produtos_venda.id_venda = ? GROUP BY produto.nome_produto";
    private final String LISTBYNOTIDVENDA = "SELECT DISTINCT produto.id, produto.nome_produto,produto.valor FROM produto left JOIN produtos_venda ON (produtos_venda.id_produto = produto.id) WHERE produtos_venda.id_venda IS NULL OR produtos_venda.id_venda <> ?";
    private final String SELECTSUBTOTALVENDA = "SELECT SUM(produto.valor) as subtotal from produto INNER JOIN produtos_venda ON (produtos_venda.id_produto = produto.id) WHERE produtos_venda.id_venda = ? ";
    
    public double subtotalVenda(int id_venda){
         Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Produto produto = new Produto();
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(SELECTSUBTOTALVENDA);
            pstm.setInt(1, id_venda);
            rs = pstm.executeQuery();
            while (rs.next()) {
                
                return rs.getDouble("subtotal") ;
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao somar o subtotal da venda"
                    + e.getMessage());
        }

        return 0.0;
        
    }
    
    
    public Resposta inserirProduto(Produto produto) {

        if (produto != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(INSERT);
                pstm.setString(1, produto.getNome());
                pstm.setDouble(2, produto.getValor());

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

    public ArrayList<Produto> getProdutosWhereNotInVenda(int id_venda) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Produto> produtos = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYNOTIDVENDA);
            pstm.setInt(1, id_venda);

            rs = pstm.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setValor(rs.getDouble("valor"));
                produtos.add(produto);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar produtos!" + e.getMessage());
        }

        return produtos;

    }

    public ArrayList<Produto> getProdutosWhereInVenda(int id_venda) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Produto> produtos = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYVENDA);
            pstm.setInt(1, id_venda);

            rs = pstm.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setQtd(rs.getInt("qtd"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setValorTotal(rs.getDouble("valor_total"));
                produto.setValor(rs.getDouble("valor"));
                produtos.add(produto);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar produtos!" + e.getMessage());
        }

        return produtos;

    }

    public ArrayList<Produto> getProdutos() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Produto> produtos = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LIST);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Produto produto = new Produto();
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setValor(rs.getDouble("valor"));
                produtos.add(produto);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar produtos!" + e.getMessage());
        }

        return produtos;

    }

    public Resposta remover(int id) {
        Connection con = null;
        try {
            con = ConexaoBD.getConexao();
            PreparedStatement pstm;
            pstm = con.prepareStatement(DELETE);
            pstm.setInt(1, id);
            pstm.execute();
            ConexaoBD.fechaConexao(con, pstm);
        } catch (Exception e) {

            Resposta resposta = new Resposta(true, 404, "Houve um erro ao excluir o produto");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Dado Excluido com sucesso");
        return resposta;
    }

    public Produto getProdutoByID(int id) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Produto produto = new Produto();
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                produto.setId(rs.getInt("id"));
                produto.setNome(rs.getString("nome_produto"));
                produto.setValor(rs.getDouble("valor"));

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar Produtos!"
                    + e.getMessage());
        }

        return produto;
    }

    public Resposta atualizar(Produto p) {
        if (p != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE);
                pstm.setString(1, p.getNome());
                pstm.setDouble(2, p.getValor());
                pstm.setInt(3, p.getId());

                pstm.execute();
                JOptionPane.showMessageDialog(null, "Produto atualizado com sucesso!");
                ConexaoBD.fechaConexao(con, pstm);
            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao atualizar o produto");
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "O produto está vazio");
            return resposta;
        }
        Resposta resposta = new Resposta(true, 200, "Produto Atualizado com sucesso");
        return resposta;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author PC-02
 */
public class CupomDAO {

    private final String INSERT = "INSERT INTO cupom (codigo_cupom,valor_desconto,tipo_desconto) VALUES(?,?,?)";
    private final String UPDATE = "UPDATE cupom SET codigo_cupom=?,valor_desconto=?,tipo_desconto=? WHERE id=?";
    private final String DELETE = "DELETE FROM cupom WHERE id=?";
    private final String LIST = "SELECT id,codigo_cupom,valor_desconto,tipo_desconto,(CASE WHEN tipo_desconto = 'p' THEN 'Em porcentagem' ELSE 'Em dinheiro' END) AS alias_desconto FROM cupom";
    private final String LISTBYID = "SELECT id,codigo_cupom,valor_desconto,tipo_desconto,(CASE WHEN tipo_desconto = 'p' THEN 'Em porcentagem' ELSE 'Em dinheiro' END) AS alias_desconto FROM cupom WHERE id=?";
    private final String CHECKCUPOM = "SELECT id,valor_desconto,tipo_desconto,codigo_cupom FROM cupom WHERE LOWER(codigo_cupom) = LOWER(?)";

    public Cupom buscarCupomPeloCodigo(String codigo_cupom) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Cupom cupom = null;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(CHECKCUPOM);
            pstm.setString(1, codigo_cupom);
            rs = pstm.executeQuery();
            while (rs.next()) {
                cupom = new Cupom();
                cupom.setId(rs.getInt("id"));
                cupom.setCodigoCupom(rs.getString("codigo_cupom"));
                cupom.setValorDesconto(rs.getDouble("valor_desconto"));
                cupom.setTipoDesconto(rs.getString("tipo_desconto"));

            }
            //JOptionPane.showMessageDialog(null,cupom.getCodigoCupom());
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar cupons!"
                    + e.getMessage());
        }

        return cupom;

    }

    public Resposta inserirCupom(Cupom cupom) {

        if (cupom != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(INSERT);
                pstm.setString(1, cupom.getCodigoCupom());
                pstm.setDouble(2, cupom.getValorDesconto());
                pstm.setString(3, cupom.getTipoDesconto());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
                Resposta resposta = new Resposta(false, 200, "Cupom Cadastrado com sucesso!");
                return resposta;

            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao inserir o cupom");
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "Dados invalidos para inserção");
            return resposta;
        }

    }

    /**
     *
     * @return
     */
    public ArrayList<Cupom> getCupons() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Cupom> cupons = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LIST);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Cupom cupom = new Cupom();
                cupom.setId(rs.getInt("id"));
                cupom.setCodigoCupom(rs.getString("codigo_cupom"));
                cupom.setValorDesconto(rs.getDouble("valor_desconto"));
                cupom.setTipoDesconto(rs.getString("tipo_desconto"));
                cupom.setLegendaDesconto(rs.getString("alias_desconto"));
                cupons.add(cupom);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar cupons!" + e.getMessage());
        }

        return cupons;

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

            Resposta resposta = new Resposta(true, 404, "Houve um erro ao excluir o cupom");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Cupom Excluido com sucesso");
        return resposta;
    }

    public Cupom getCupomByID(int id) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Cupom cupom = null;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                cupom = new Cupom();
                cupom.setId(rs.getInt("id"));
                cupom.setCodigoCupom(rs.getString("codigo_cupom"));
                cupom.setValorDesconto(rs.getDouble("valor_desconto"));
                cupom.setTipoDesconto(rs.getString("tipo_desconto"));

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar cupons!"
                    + e.getMessage());
        }

        return cupom;
    }

    public Resposta atualizar(Cupom c) {
        if (c != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE);
                pstm.setString(1, c.getCodigoCupom());
                pstm.setDouble(2, c.getValorDesconto());
                pstm.setString(3, c.getCodigoCupom());

                pstm.setInt(4, c.getId());

                pstm.execute();
                JOptionPane.showMessageDialog(null, "Cupom atualizado com sucesso!");
                ConexaoBD.fechaConexao(con, pstm);
            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao atualizar o Cupom");
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "O Cupom está vazio");
            return resposta;
        }
        Resposta resposta = new Resposta(true, 200, "Cupom Atualizado com sucesso");
        return resposta;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author PC-02
 */
public class VendaDAO {

    private final String INSERT_INIT_VENDA = "INSERT INTO venda(id_pedido,id_cliente,id_usuario) VALUES (UUID(),?,?)";
    private final String LAST_ID = "SELECT MAX(id) as ultimo_id FROM venda";
    private final String INSERT = "INSERT INTO venda (valor_bruto,valor_com_desconto,id_cupom,id_usuario,id_cliente,forma_pagamento) VALUES(?,?,?,?,?,?,?)";
    private final String UPDATE = "UPDATE venda SET valor_bruto=?,valor_com_desconto=?,id_cupom=?,id_usuario=?,id_cliente=?,forma_pagamento=? WHERE id=?";
    private final String DELETE = "DELETE FROM venda WHERE id=?";
    private final String LIST = "SELECT venda.id as id, COALESCE(venda.id_cupom,0) as id_cupom, COALESCE(venda.valor_bruto,0) as valor_bruto, COALESCE(venda.valor_com_desconto,0) as valor_liquido, COALESCE(cupom.codigo_cupom,' ') as codigo_cupom, venda.id_cliente as id_cliente,COALESCE(CONCAT(cliente.nome ,' ', cliente.sobrenome),'Anônimo') as nome_cliente, COALESCE(venda.forma_pagamento,'D') as forma_pagamento, DATE_FORMAT(venda.data_compra, '%d/%m/%Y %H:%i:%s') as data_compra, COALESCE(CONCAT(usuario.nome,' ',usuario.sobrenome),'Anonimo') as nome_usuario, venda.id_usuario as id_usuario FROM venda LEFT JOIN cupom on (venda.id_cupom = cupom.id) LEFT JOIN cliente ON (venda.id_cliente = cliente.id) LEFT JOIN usuario ON (venda.id_usuario = usuario.id) ORDER BY data_compra desc";
    private final String LISTBYID = "SELECT venda.id as id, COALESCE(venda.id_cupom,0) as id_cupom, COALESCE(venda.valor_bruto,0) as valor_bruto, COALESCE(venda.valor_com_desconto,0) as valor_liquido, COALESCE(cupom.codigo_cupom,' ') as codigo_cupom, venda.id_cliente as id_cliente, COALESCE(CONCAT(cliente.nome ,' ', cliente.sobrenome),'Anônimo') as nome_cliente, COALESCE(venda.forma_pagamento,'D') as forma_pagamento,  DATE_FORMAT(venda.data_compra, '%d/%m/%Y %H:%i:%s') as data_compra,  COALESCE(CONCAT(usuario.nome,' ',usuario.sobrenome),'Anonimo') as nome_usuario, venda.id_usuario as id_usuario FROM venda LEFT JOIN cupom on (venda.id_cupom = cupom.id) LEFT JOIN cliente ON (venda.id_cliente = cliente.id) LEFT JOIN usuario ON (venda.id_usuario = usuario.id) WHERE venda.id = ?";
    private final String UPDATE_ETAPA_2 = "UPDATE venda SET valor_bruto=?,valor_com_desconto=? WHERE id=?";
    private final String UPDATE_ETAPA_3 = "UPDATE venda SET valor_bruto=?,valor_com_desconto=?,id_cupom = ?,forma_pagamento = ? WHERE id=?";
    private final String SUM_OF_MONTH = "SELECT sum(valor_com_desconto) as faturamento FROM venda WHERE data_compra >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) ";
      private final String CONT_OF_MONTH = "SELECT count(id) as num_vendas FROM venda WHERE data_compra >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) ";
    public double FaturamentoUltimos30() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        double faturamento = 0;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(SUM_OF_MONTH);

            rs = pstm.executeQuery();
            while (rs.next()) {

                faturamento = rs.getDouble("faturamento");

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao realizar a soma!"
                    + e.getMessage());
            return 0;
        }
        return faturamento;
    }
     public int NumVendasUltimos30() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int faturamento = 0;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(CONT_OF_MONTH);

            rs = pstm.executeQuery();
            while (rs.next()) {

                faturamento = rs.getInt("num_vendas");

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao realizar a contagem!"
                    + e.getMessage());
            return 0;
        }
        return faturamento;
    }

    public Resposta UpdateUltimaEtapaVenda(Venda venda) {
        if (venda != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE_ETAPA_3);
                pstm.setDouble(1, venda.getValorBruto());
                pstm.setDouble(2, venda.getValorLiquido());
                if (venda.getId_cupom() != 0) {

                    pstm.setInt(3, venda.getId_cupom());
                } else {

                    pstm.setString(3, null);
                }

                pstm.setString(4, venda.getFormaPagamento());
                pstm.setInt(5, venda.getId());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
            } catch (ClassNotFoundException | SQLException e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao realizar a venda" + e.getMessage());
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "A venda está vazia");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Venda Realizada com sucesso");
        return resposta;

    }

    public Resposta UpdateSegundaEtapaVenda(Venda venda) {
        if (venda != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE_ETAPA_2);
                pstm.setDouble(1, venda.getValorBruto());
                pstm.setDouble(2, venda.getValorLiquido());
                pstm.setInt(3, venda.getId());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
            } catch (ClassNotFoundException | SQLException e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao atualizar a venda" + e.getMessage());
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "A venda está vazia");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Venda Atualizada com sucesso");
        return resposta;

    }

    public int inserirVenda(Venda venda) {

        if (venda != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                ResultSet rs = null;
                pstm = con.prepareStatement(INSERT_INIT_VENDA);
                System.out.println(venda.getIdCliente() + "   " + venda.getIdUsuario());
                pstm.setInt(1, venda.getIdCliente());
                pstm.setInt(2, venda.getIdUsuario());
                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
                con = ConexaoBD.getConexao();
                pstm = con.prepareStatement(LAST_ID);
                rs = pstm.executeQuery();
                int ultimo_id = 0;
                while (rs.next()) {
                    ultimo_id = rs.getInt("ultimo_id");
                    return ultimo_id;
                }

            } catch (Exception e) {
                JOptionPane.showMessageDialog(null, "Houve um erro ao processar essa requisição!" + e.getMessage());
            }
        } else {
            JOptionPane.showMessageDialog(null, "Dados invalidos para inserção");

        }
        return 0;
    }

    /**
     *
     * @return
     */
    public ArrayList<Venda> getVendas() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Venda> vendas = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LIST);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Venda venda = new Venda();
                venda.setId(rs.getInt("id"));
                venda.setId_cupom(rs.getInt("id_cupom"));
                venda.setCodigoCupom(rs.getString("codigo_cupom"));
                venda.setIdCliente(rs.getInt("id_cliente"));
                venda.setNomeCliente(rs.getString("nome_cliente"));
                venda.setIdUsuario(rs.getInt("id_usuario"));
                venda.setNomeUsuario(rs.getString("nome_usuario"));
                venda.setFormaPagamento(rs.getString("forma_pagamento"));
                venda.setDataCompra(rs.getString("data_compra"));
                venda.setValorBruto(rs.getDouble("valor_bruto"));
                venda.setValorLiquido(rs.getDouble("valor_liquido"));
                vendas.add(venda);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar vendas!" + e.getMessage());
        }

        return vendas;

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

            Resposta resposta = new Resposta(true, 404, "Houve um erro ao excluir a venda");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Venda Excluida com sucesso");
        return resposta;
    }

    public Venda getvendaByID(int id) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Venda venda = null;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                venda = new Venda();
                venda.setId(rs.getInt("id"));
                venda.setId_cupom(rs.getInt("id_cupom"));
                venda.setCodigoCupom(rs.getString("codigo_cupom"));
                venda.setIdCliente(rs.getInt("id_cliente"));
                venda.setNomeCliente(rs.getString("nome_cliente"));
                venda.setIdUsuario(rs.getInt("id_usuario"));
                venda.setNomeUsuario(rs.getString("nome_usuario"));
                venda.setFormaPagamento(rs.getString("forma_pagamento"));
                venda.setDataCompra(rs.getString("data_compra"));
                venda.setValorBruto(rs.getDouble("valor_bruto"));
                venda.setValorLiquido(rs.getDouble("valor_liquido"));

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar vendas!"
                    + e.getMessage());
        }

        return venda;
    }

    public Resposta atualizar(Venda v) {
        if (v != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE);
                pstm.setDouble(1, v.getValorBruto());
                pstm.setDouble(2, v.getValorLiquido());
                pstm.setInt(3, v.getId_cupom());
                pstm.setInt(4, v.getIdUsuario());
                pstm.setInt(5, v.getIdCliente());
                pstm.setString(6, v.getFormaPagamento());
                pstm.setInt(7, v.getId());

                pstm.execute();
                JOptionPane.showMessageDialog(null, "Venda atualizada com sucesso!");
                ConexaoBD.fechaConexao(con, pstm);
            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao atualizar a venda");
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "A venda está vazio");
            return resposta;
        }
        Resposta resposta = new Resposta(true, 200, "Venda Atualizada com sucesso");
        return resposta;
    }
}

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
public class ClienteDAO {

    private final String INSERT = "INSERT INTO cliente (nome,sobrenome,email,telefone,cep,cpf) VALUES(?,?,?,?,?,?)";
    private final String UPDATE = "UPDATE cliente SET nome=?,sobrenome=?,email=?,telefone=?,cep=?, cpf=? WHERE id=?";
    private final String DELETE = "DELETE FROM cliente WHERE id=?";
    private final String LIST = "SELECT * FROM cliente";
    private final String LISTBYID = "SELECT * FROM cliente WHERE id=?";
    private final String CONT_OF_MONTH = "SELECT COUNT(id) as clientes from cliente WHERE data_insert >= DATE_SUB(CURDATE(), INTERVAL 30 DAY) ";

    public int contaClientesUltimos30() {

        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        int clientes_cont = 0;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(CONT_OF_MONTH);
            rs = pstm.executeQuery();

            while (rs.next()) {
                clientes_cont = rs.getInt("clientes");
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar clientes!" + e.getMessage());
            return clientes_cont;

        }

        return clientes_cont;

    }

    public Resposta inserirCliente(Cliente cliente) {

        if (cliente != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(INSERT);
                pstm.setString(1, cliente.getNome());
                pstm.setString(2, cliente.getSobrenome());
                pstm.setString(3, cliente.getEmail());
                pstm.setString(4, cliente.getTelefone());
                pstm.setString(5, cliente.getCep());
                pstm.setString(6, cliente.getCpf());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
                Resposta resposta = new Resposta(false, 200, "Cliente Cadastrado com sucesso!");
                return resposta;

            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao inserir o cliente");
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
    public ArrayList<Cliente> getClientes() {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        ArrayList<Cliente> clientes = new ArrayList<>();

        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LIST);
            rs = pstm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente(rs.getString("nome"), rs.getString("sobrenome"), rs.getString("email"));
                cliente.setId(rs.getInt("id"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCpf(rs.getString("cpf"));
                clientes.add(cliente);
            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar clientes!" + e.getMessage());
        }

        return clientes;

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

            Resposta resposta = new Resposta(true, 404, "Houve um erro ao excluir o cliente");
            return resposta;
        }
        Resposta resposta = new Resposta(false, 200, "Cliente Excluido com sucesso");
        return resposta;
    }

    public Cliente getClienteByID(int id) {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        Cliente cliente = null;
        try {
            con = ConexaoBD.getConexao();
            pstm = con.prepareStatement(LISTBYID);
            pstm.setInt(1, id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                cliente = new Cliente(rs.getString("nome"), rs.getString("sobrenome"), rs.getString("email"));
                cliente.setId(rs.getInt("id"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCpf(rs.getString("cpf"));

            }
            ConexaoBD.fechaConexao(con, pstm, rs);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Erro ao listar clientes!"
                    + e.getMessage());
        }

        return cliente;
    }

    public Resposta atualizar(Cliente c) {
        if (c != null) {
            Connection con = null;
            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(UPDATE);
                pstm.setString(1, c.getNome());
                pstm.setString(2, c.getSobrenome());
                pstm.setString(3, c.getEmail());
                pstm.setString(4, c.getTelefone());
                pstm.setString(5, c.getCep());
                pstm.setString(6, c.getCpf());

                pstm.setInt(7, c.getId());

                pstm.execute();

                ConexaoBD.fechaConexao(con, pstm);
            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 404, "Houve um erro ao atualizar o cliente" + e.getMessage());
                return resposta;
            }
        } else {
            Resposta resposta = new Resposta(true, 404, "O cliente está vazio");
            return resposta;
        }
        Resposta resposta = new Resposta(true, 200, "Cliente Atualizado com sucesso");
        return resposta;
    }
}

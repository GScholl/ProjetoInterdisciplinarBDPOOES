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
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author PC-02
 */
public class UsuarioDAO {

    private final String INSERT = "INSERT INTO usuario (nome,sobrenome,email,senha,cpf) values (?,?,?,?,?)";
    private final String UPDATE_BY_ID = "UPDATE usuario set nome= ?,sobrenome = ?,email = ?,senha = ? WHERE id = ?";
    private final String SELECT_TO_CHECK_EMAIL = "SELECT * FROM usuario where email = ? ";
    private final String SELECT_TO_CHECK_CPF = "SELECT * FROM usuario where cpf = ?";
    private final String AUTH_SELECT = "SELECT * FROM usuario where email = ? ";
    private final String SELECT_TO_CHECK_ID = "SELECT * FROM usuario where id = ?";

    public Resposta AutenticaUsuario(Usuario u) throws SQLException {

        if (!this.verificaSeEmailUsuarioExiste(u.getEmail())) {
            Resposta resposta = new Resposta(true, 500, "O E-mail utilizado não está cadastrado!");

            return resposta;

        }

        if (u != null) {
            Connection con = null;
            PreparedStatement pstm = null;
            ResultSet rs = null;

            try {
                con = ConexaoBD.getConexao();

                pstm = con.prepareStatement(AUTH_SELECT);

                pstm.setString(1, u.getEmail());
                int id_usuario = 0;
                rs = pstm.executeQuery();
                int count = 0;
                boolean matches = false;
                while (rs.next()) {
                    if (BCrypt.checkpw(u.getSenha(), rs.getString("senha"))) {
                        matches = true;
                        count++;
                        id_usuario = rs.getInt("id");

                    }
                }
                ConexaoBD.fechaConexao(con, pstm, rs);

                if (count > 0) {
                    Resposta resposta = new Resposta(false, 200, "Usuário Logado com sucesso");
                    resposta.setUsuario(id_usuario);
                    return resposta;
                } else {
                    Resposta resposta = new Resposta(true, 200, "Usuário ou senha incorretos");
                    return resposta;
                }

            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 500, "Houve um erro na autenticação, Por favor tente novamente mais tarde!" + e.getMessage());
                return resposta;
            }

        }
        Resposta resposta = new Resposta(true, 404, "Houve um erro ao processar os dados");
        return resposta;

    }

    public Resposta InsertNovoUsuario(Usuario c) throws SQLException {

        // Gerar um hash seguro da senha
        if (this.verificaSeEmailUsuarioExiste(c.getEmail())) {
            Resposta resposta = new Resposta(true, 500, "O E-mail utilizado já existe em nosso Sistema");

            return resposta;

        }
        if (this.verificaSeCPFUsuarioExiste(c.getCpf())) {
            Resposta resposta = new Resposta(true, 500, "O CPF utilizado já existe em nosso Sistema");

            return resposta;

        }

        if (c != null) {
            Connection con = null;

            try {
                con = ConexaoBD.getConexao();
                PreparedStatement pstm;
                pstm = con.prepareStatement(INSERT);
                pstm.setString(1, c.getNome());
                pstm.setString(2, c.getSobrenome());
                pstm.setString(3, c.getEmail());
                pstm.setString(4, BCrypt.hashpw(c.getSenha(), BCrypt.gensalt()));
                pstm.setString(5, c.getCpf());
                pstm.execute();
                 ConexaoBD.fechaConexao(con,pstm);

            } catch (Exception e) {
                Resposta resposta = new Resposta(true, 500, "Houve um erro ao inserir o seu Usuário" + e.getMessage());
                return resposta;
            }

            Resposta resposta = new Resposta(false, 200, "Usuário Registrado com sucesso");
            return resposta;
        }
        Resposta resposta = new Resposta(true, 404, "Dados de usuário nulos ou inexistentes");
        return resposta;
    }

    public boolean verificaSeEmailUsuarioExiste(String email) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {

            con = ConexaoBD.getConexao();

            pstm = con.prepareStatement(SELECT_TO_CHECK_EMAIL);
            pstm.setString(1, email);

            rs = pstm.executeQuery();
             ConexaoBD.fechaConexao(con,pstm,rs);
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                return true;
            }
            
        } catch (ClassNotFoundException | SQLException e) {

            return true;
        }
        return false;
    }

    public boolean verificaSeCPFUsuarioExiste(String cpf) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {

            con = ConexaoBD.getConexao();

            pstm = con.prepareStatement(SELECT_TO_CHECK_CPF);

            pstm.setString(1, cpf);

            rs = pstm.executeQuery();
             ConexaoBD.fechaConexao(con,pstm,rs);
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                return true;
            }

        } catch (Exception e) {

            return true;
        }
        return false;
    }

    public boolean verificaSeIDUsuarioExiste(int id) throws SQLException {
        Connection con = null;
        PreparedStatement pstm = null;
        ResultSet rs = null;
        try {

            con = ConexaoBD.getConexao();

            pstm = con.prepareStatement(SELECT_TO_CHECK_ID);

            pstm.setInt(1, id);

            rs = pstm.executeQuery();
             ConexaoBD.fechaConexao(con,pstm,rs);
            int count = 0;
            while (rs.next()) {
                count++;
            }
            if (count > 0) {
                return true;
            }

        } catch (Exception e) {

            return true;
        }
        return false;
    }
}

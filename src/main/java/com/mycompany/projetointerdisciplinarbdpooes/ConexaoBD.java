/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author PC-02
 */
public class ConexaoBD {

    private static final String USUARIO = "root";
    private static final String SENHA = "";
    private static final String DATABASE = "projetoJava";
    private static final String DRIVER_CONEXAO = "com.mysql.cj.jdbc.Driver";
    private static final String STR_CONEXAO = "jdbc:mysql://localhost:3306/";

    public static Connection getConexao() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        try {
            Class.forName(DRIVER_CONEXAO);
            conn = DriverManager.getConnection(STR_CONEXAO + DATABASE, USUARIO, SENHA);
            return conn;
        } catch (ClassNotFoundException e) {

            throw new ClassNotFoundException(
                    "Drive MySql não foi encontrado " + e.getMessage()
            );
        } catch (SQLException e) {
            throw new SQLException("Erro ao conectar com  a base de dados " + e.getMessage());
        }

    }

     public static void fechaConexao(Connection con) {
        try {
            if (con != null) {
                con.close();
                System.out.println("Conexao fechada com sucesso");
            }

        } catch (SQLException e) {
          

        }
    }

    public static void fechaConexao(Connection con, Statement st) {
        try {

            if (con != null) {
                fechaConexao(con);
            }
            if (st != null) {
                st.close();
              
            }

        } catch (Exception e) {
            
        }
    }
        public static void fechaConexao(Connection con, Statement st, ResultSet rs) {
        try {
            
            if (rs != null) {
               rs.close();
            }
            if (st != null) {
                fechaConexao(con,st);
            }

        } catch (Exception e) {
            
        }
    }

}

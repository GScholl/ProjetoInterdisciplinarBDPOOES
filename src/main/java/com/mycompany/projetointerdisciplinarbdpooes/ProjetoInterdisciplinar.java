/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;

/**
 *
 * @author PC-02
 */
public class ProjetoInterdisciplinar {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws SQLException, ClassNotFoundException, ParseException {
        Connection conexao = null;
        conexao = ConexaoBD.getConexao();

        //RegistrarUsuario ru = new RegistrarUsuario();
        //ru.setVisible(true);
        LoginUsuario lu = new LoginUsuario();
        lu.setVisible(true);

    }

}

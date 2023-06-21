/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.Color;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.WindowConstants;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author PC-02
 */
public class LoginUsuario extends JFrame {

    private JPanel painelFundo;
    private JPanel painelBotoes;
    private JButton btnLogar;
    private JButton btnSair;
    private JButton btnRegistro;

    private JLabel labelEmail;
    private JLabel labelSenha;
    private JTextField textEmail;
    private JTextField textSenha;

    public LoginUsuario() {
        super("Login");
        criarJanela();
    }

    public void criarJanela() {

        //Criação e customização do Botão logar
        btnLogar = new JButton("Login");
        btnLogar.setBackground(Color.WHITE);
        btnLogar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        //Criação e customização do Botão Sair
        btnSair = new JButton("Sair");
        btnSair.setBackground(Color.WHITE);
        btnSair.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        //Criação e customização do Botão Registrar-
        btnRegistro = new JButton("Registrar-se");
        btnRegistro.setBackground(Color.WHITE);
        btnRegistro.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        // Criação de labels dos inputs
        labelEmail = new JLabel("E-mail:");
        labelSenha = new JLabel("Senha:");

        //Criação e costumização dos inputs
        textEmail = new JTextField(20);
        textEmail.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textSenha = new JPasswordField(20);
        textSenha.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        // Criação e costumização do painel principal
        painelFundo = new JPanel();
        painelFundo.setLayout(new GridBagLayout());
        painelFundo.setBackground(Color.WHITE);

        //Setando o layout e suas caracteristicas
        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);
        //Adicionando e posicionando elementos no painel de fundo
        painelFundo.add(labelEmail, gbc);
        gbc.gridx = 1;
        painelFundo.add(textEmail, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        painelFundo.add(labelSenha, gbc);
        gbc.gridx = 1;
        painelFundo.add(textSenha, gbc);
        getContentPane().add(painelFundo);
        JPanel painelBotoes = new JPanel();
        painelBotoes.add(btnLogar);
        painelBotoes.add(btnSair);
        painelBotoes.add(btnRegistro);
        getContentPane().add(painelBotoes, "South");
        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);
        btnLogar.addActionListener(new btnLogarListener());
        btnSair.addActionListener(new btnSairListener());
        btnRegistro.addActionListener(new btnRegistroListener());
    }

    private class btnLogarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (textEmail.getText().isEmpty() || textSenha.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Por favor, Insira seu E-mail e Senha corretamente");
            } else {

                Verificador verify = new Verificador();
                if (!verify.verificaEmail(textEmail.getText())) {
                    JOptionPane.showMessageDialog(null, "Seu E-mail não é valido");
                    return;
                }
                if (!verify.verificaTamanhoCampo(textSenha, 8, 16)) {
                    JOptionPane.showMessageDialog(null, "Sua senha precisa conter no minimo 8 caracteres e no máximo 16! ");
                    return;
                }
                if (!verify.verificaTamanhoCampo(textEmail, 6, 36)) {
                    JOptionPane.showMessageDialog(null, "Seu E-mail precisa conter no minimo 6 caracteres e no máximo 36! ");
                    return;
                }
                Usuario usuario = new Usuario(textEmail.getText());
                UsuarioDAO dao = new UsuarioDAO();
                usuario.setSenha(textSenha.getText());
                try {
                    Resposta resposta = dao.AutenticaUsuario(usuario);
                    if(!resposta.isErro()){
                        dispose();
                        DashBoard dashboard = new DashBoard(resposta.getUsuario());
                        dashboard.setVisible(true);
                    }else{
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                    }
                } catch (SQLException ex) {
                    Logger.getLogger(LoginUsuario.class.getName()).log(Level.SEVERE, null, ex);
                }

            }
        }
    }

    private class btnSairListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            dispose();
        }
    }

    private class btnRegistroListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {

            dispose();
            RegistrarUsuario ru;
            try {
                ru = new RegistrarUsuario();
                ru.setVisible(true);

            } catch (ParseException ex) {
                Logger.getLogger(LoginUsuario.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }
}

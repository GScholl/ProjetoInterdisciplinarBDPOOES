/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.Color;
import java.awt.Font;
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
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.WindowConstants;
import javax.swing.text.MaskFormatter;

public class RegistrarUsuario extends JFrame {

    private Font font;
    private JPanel painelFundo;
    private JButton btnRegistrar;
    private JButton btnVoltar;
    private JLabel labelNome;
    private JLabel labelSobrenome;
    private JLabel labelEmail;
    private JLabel labelSenha;
    private JLabel labelCPF;
    private JTextField textNome;
    private JTextField textSobrenome;
    private JTextField textEmail;
    private JTextField textSenha;
    private JTextField textCPF;

    public RegistrarUsuario() throws ParseException {
        super("Registrar");
        criarJanela();
    }

    public void criarJanela() throws ParseException {
        font = new Font("Arial", Font.BOLD, 12);

        // Criação e customização do Botão de Registrar
        btnRegistrar = new JButton("Registrar-se");
        btnRegistrar.setBackground(Color.WHITE);
        btnRegistrar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btnRegistrar.setFont(font);

        // Criação e customização do Botão de Voltar
        btnVoltar = new JButton("Voltar");
        btnVoltar.setBackground(Color.WHITE);
        btnVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btnRegistrar.setFont(font);

        //Criação dos labels de inputs
        labelNome = new JLabel("Nome:");
        labelNome.setFont(font);
        labelSobrenome = new JLabel("Sobrenome:");
        labelSobrenome.setFont(font);
        labelEmail = new JLabel("E-mail:");
        labelEmail.setFont(font);
        labelSenha = new JLabel("Senha:");
        labelSenha.setFont(font);
        labelCPF = new JLabel("CPF:");
        labelCPF.setFont(font);
        //Criação do input de nome
        textNome = new JTextField(20);
        textNome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textNome.setFont(font);

        // Criação do input de sobrenome
        textSobrenome = new JTextField(20);
        textSobrenome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textSobrenome.setFont(font);

        // criação do input de email
        textEmail = new JTextField(20);
        textEmail.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textEmail.setFont(font);

        textSenha = new JPasswordField(20);
        textSenha.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textSenha.setFont(font);

        textCPF = new JFormattedTextField(new MaskFormatter("###.###.###-##"));
        textCPF.setColumns(20);
        textCPF.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        textCPF.setFont(font);

        painelFundo = new JPanel();
        painelFundo.setLayout(new GridBagLayout());
        painelFundo.setBackground(Color.WHITE);
        painelFundo.setFont(font);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.anchor = GridBagConstraints.WEST;
        gbc.insets = new Insets(5, 5, 5, 5);

        painelFundo.add(labelNome, gbc);
        gbc.gridx = 1;
        painelFundo.add(textNome, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        painelFundo.add(labelSobrenome, gbc);
        gbc.gridx = 1;
        painelFundo.add(textSobrenome, gbc);
        gbc.gridx = 0;
        gbc.gridy++;
        painelFundo.add(labelCPF, gbc);
        gbc.gridx = 1;
        painelFundo.add(textCPF, gbc);
        gbc.gridx = 0;
        gbc.gridy++;

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
        painelBotoes.add(btnRegistrar);
        painelBotoes.add(btnVoltar);

        getContentPane().add(painelBotoes, "South");

        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        pack();
        setLocationRelativeTo(null);

        btnRegistrar.addActionListener(new btnRegistrarListener());
        btnVoltar.addActionListener(new btnVoltarListener());
    }

    // Função de chamada de evento do Botão de registrar
    private class btnRegistrarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            if (textNome.getText().isEmpty() || textSobrenome.getText().isEmpty() || textEmail.getText().isEmpty() || textSenha.getText().isEmpty() || textCPF.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Por favor preencha todos os dados de cadastro!");

            } else {
                Verificador verify = new Verificador();

                if (!verify.verificaTamanhoCampo(textNome, 3, 64)) {
                    JOptionPane.showMessageDialog(null, "O seu nome precisa conter no minimo 3 caracteres e no máximo 64");
                    return;
                }
                if (!verify.verificaTamanhoCampo(textSobrenome, 3, 64)) {
                    JOptionPane.showMessageDialog(null, "O seu sobrenome precisa conter no minimo 3 caracteres e no máximo 64");
                    return;
                }
                if(verify.verificaCaracteresEspeciais(textNome.getText()) || verify.verificaCaracteresEspeciais(textSobrenome.getText()) || verify.verificaNumeros(textNome.getText()) || verify.verificaNumeros(textSobrenome.getText())){
                    JOptionPane.showMessageDialog(null, "Nome e sobrenome não podem conter números ou caracteres especiais");
                    return; 
                }
                if (!verify.isCPF(textCPF.getText().replace(".", "").replace("-", ""))) {
                       JOptionPane.showMessageDialog(null, "Seu CPF não é um CPF Válido");
                    return; 
                }
                if (!verify.verificaEmail(textEmail.getText())) {
                    JOptionPane.showMessageDialog(null, "Seu E-mail não é válido");
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
                usuario.setNome(textNome.getText());
                usuario.setEmail(textEmail.getText());
                usuario.setSenha(textSenha.getText());
                usuario.setCpf(textCPF.getText());
                usuario.setSobrenome(textSobrenome.getText());
                UsuarioDAO dao = new UsuarioDAO();
                try {
                    Resposta resposta = dao.InsertNovoUsuario(usuario);
                    
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                    dispose();
                    LoginUsuario lu = new LoginUsuario();
                    lu.setVisible(true);
                } catch (SQLException ex) {
                    JOptionPane.showMessageDialog(null, ex.getMessage());
                }

            }
        }
    }
    // Função de chamada de evento do Botão de Voltar

    private class btnVoltarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            System.out.println("Voltar");
            dispose();
            LoginUsuario lu = new LoginUsuario();
            lu.setVisible(true);
        }
    }
}

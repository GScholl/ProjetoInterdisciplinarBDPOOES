/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

/**
 *
 * @author PC-02
 */
public class DashBoard extends JFrame {

    private JPanel painelSuperior, painelCards, painelInferior, painelTitulo;
    private JButton botaoCupons, botaoVendas, botaoClientes, botaoProdutos, botaoDeslogar;
    private JLabel lblVendas, lblClientes, lblFaturamento, titulo, lblFaturamentoMes;
    private int idUsuario;

    public DashBoard(int idUsuario) throws SQLException {
        super("Dashboard");
        this.idUsuario = idUsuario;
        criarJanela();

    }

    public void criarJanela() throws SQLException {
        UsuarioDAO userDAO = new UsuarioDAO();

        if (!userDAO.verificaSeIDUsuarioExiste(idUsuario)) {
            dispose();
            LoginUsuario lu = new LoginUsuario();
            lu.setVisible(true);
            JOptionPane.showMessageDialog(null, "Por Favor, realize o Login antes de acessar o sistema!");
            return;
        }
        // Painel superior com os cards
        titulo = new JLabel("Relatório mensal");
        Font fonte = titulo.getFont();
        int tamanhoFonte = 17; // Tamanho da fonte desejado
        titulo.setFont(fonte.deriveFont(Font.PLAIN, tamanhoFonte));
        painelSuperior = new JPanel();
        painelSuperior.setLayout(new BorderLayout());

        painelSuperior.setBorder(new EmptyBorder(10, 10, 10, 10));
        painelSuperior.setBackground(Color.WHITE);
        add(painelSuperior, BorderLayout.NORTH);

        // Painel dos cards
        painelTitulo = new JPanel();
        painelCards = new JPanel();
        painelTitulo.add(titulo, BorderLayout.CENTER);
        painelCards.setLayout(new GridLayout(1, 3, 10, 0));
        painelSuperior.add(painelCards, BorderLayout.CENTER);
        painelTitulo.setBackground(Color.WHITE);
        painelSuperior.add(painelTitulo, BorderLayout.NORTH);

        // Criação dos labels dos cards
        VendaDAO vdao = new VendaDAO();
        int vendas_cont = vdao.NumVendasUltimos30();
        lblVendas = new JLabel("<html>Número de vendas:<br>    " + vendas_cont + "</html>");
        lblVendas.setHorizontalAlignment(JLabel.CENTER);
        ClienteDAO cdao = new ClienteDAO();
        int clientes_cont = cdao.contaClientesUltimos30();
        lblClientes = new JLabel("<html>Novos Clientes<br> " + clientes_cont + "</html>");
        lblClientes.setHorizontalAlignment(JLabel.CENTER);
        DecimalFormat decimalFormat = new DecimalFormat("#0.00");

        double fat_30 = vdao.FaturamentoUltimos30();
        lblFaturamento = new JLabel("<html>Faturamento total<br> R$ " + decimalFormat.format(fat_30) + "</html>");
        lblFaturamento.setHorizontalAlignment(JLabel.CENTER);

        painelCards.add(lblVendas);
        painelCards.add(lblClientes);
        painelCards.add(lblFaturamento);

        painelCards.setBackground(Color.WHITE);
        // Painel inferior com os botões
        painelInferior = new JPanel();
        painelInferior.setBorder(new EmptyBorder(10, 10, 10, 10));
        add(painelInferior, BorderLayout.SOUTH);

        // Criação dos botões
        botaoVendas = new JButton("Vendas");
        botaoVendas.setBackground(Color.WHITE);
        botaoVendas.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        botaoCupons = new JButton("Cupons");
        botaoCupons.setBackground(Color.WHITE);
        botaoCupons.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        botaoClientes = new JButton("Clientes");
        botaoClientes.setBackground(Color.WHITE);
        botaoClientes.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        botaoProdutos = new JButton("Produtos");
        botaoProdutos.setBackground(Color.WHITE);
        botaoProdutos.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        botaoDeslogar = new JButton("Deslogar");
        botaoDeslogar.setBackground(Color.RED);
        botaoDeslogar.setForeground(Color.white);
        botaoDeslogar.setBorder(new BordaRedonda(Color.RED, 10));

        botaoDeslogar.addActionListener(new btnDeslogarListener());
        botaoProdutos.addActionListener(new btnProdutosListener());
        botaoClientes.addActionListener(new btnClientesListener());
        botaoVendas.addActionListener(new btnVendasListener());
        botaoCupons.addActionListener(new btnCuponsListener());

        painelInferior.add(botaoVendas);
        painelInferior.add(botaoCupons);
        painelInferior.add(botaoClientes);
        painelInferior.add(botaoProdutos);
        painelInferior.add(botaoDeslogar);

        setSize(500, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        setVisible(true);

    }

    private class btnDeslogarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            System.exit(0);
        }

    }

    private class btnProdutosListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            setVisible(false);
            ListarProdutos lp;
            try {
                lp = new ListarProdutos(idUsuario);
                lp.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private class btnClientesListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            setVisible(false);
            ListarClientes lc;
            try {
                lc = new ListarClientes(idUsuario);
                lc.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
            } catch (ParseException ex) {
                Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private class btnVendasListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            setVisible(false);
            ListarVendas lv;
            try {
                try {
                    lv = new ListarVendas(idUsuario);
                    lv.setVisible(true);
                } catch (ParseException ex) {
                    Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
                }

            } catch (SQLException ex) {
                Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
            }

        }

    }

    private class btnCuponsListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            setVisible(false);
            ListarCupons lcu;
            try {
                lcu = new ListarCupons(idUsuario);
                lcu.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(DashBoard.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

}

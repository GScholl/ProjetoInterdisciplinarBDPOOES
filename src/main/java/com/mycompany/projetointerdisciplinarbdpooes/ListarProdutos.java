/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import static javax.swing.JFrame.EXIT_ON_CLOSE;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC-02
 */
public class ListarProdutos extends JFrame {

    private JPanel painelFundo;
    private JPanel painelBotoes;
    private JTable tabela;
    private JScrollPane barraRolagem;
    private JButton btInserir;
    private JButton btAlterar;
    private JButton btExcluir;
    private JButton btVoltar;
    private int id_usuario;
    private final DefaultTableModel modelo = new DefaultTableModel() {
        @Override
        public boolean isCellEditable(int row, int column) {
            //all cells false
            return false;
        }

    };

    public ListarProdutos(int idUsuario) throws SQLException {
        super("Produtos");
        criarJTable();
        criarJanela();
        this.id_usuario = idUsuario;

    }

    public void criarJanela() throws SQLException {
        UsuarioDAO userDAO = new UsuarioDAO();
        if (!userDAO.verificaSeIDUsuarioExiste(id_usuario)) {
            dispose();
            LoginUsuario lu = new LoginUsuario();
            lu.setVisible(true);
            JOptionPane.showMessageDialog(null, "Por Favor, realize o Login antes de acessar o sistema!");
            return;
        }
        btInserir = new JButton("Inserir");
        btInserir.setBackground(Color.WHITE);
        btInserir.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btAlterar = new JButton("Alterar");
        btAlterar.setBackground(Color.WHITE);
        btAlterar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btExcluir = new JButton("Excluir");
        btExcluir.setBackground(Color.WHITE);
        btExcluir.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btVoltar = new JButton("Voltar");
        btVoltar.setBackground(Color.WHITE);
        btVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        painelBotoes = new JPanel();
        barraRolagem = new JScrollPane(tabela);
        painelFundo = new JPanel();
        painelFundo.setLayout(new BorderLayout());
        painelFundo.add(BorderLayout.CENTER, barraRolagem);
        painelBotoes.add(btInserir);
        painelBotoes.add(btAlterar);
        painelBotoes.add(btExcluir);
        painelBotoes.add(btVoltar);
        painelFundo.setBackground(Color.white);
        painelFundo.add(BorderLayout.SOUTH, painelBotoes);
        getContentPane().add(painelFundo);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(500, 320);
        setLocationRelativeTo(null);
        btInserir.addActionListener(new btInserirListener());
        btAlterar.addActionListener(new btAlterarListener());
        btExcluir.addActionListener(new btExcluirListener());
        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btInserirListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            InserirProduto ip = new InserirProduto(modelo);
            ip.setVisible(true);
        }
    }
    private class btVoltarListener implements ActionListener{
        
        @Override
        public void actionPerformed(ActionEvent ae){
            
            try {
                DashBoard ds = new DashBoard(id_usuario);
                dispose();
                ds.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(ListarProdutos.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private class btAlterarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            int linhaselecionada = -1;
            linhaselecionada = tabela.getSelectedRow();
            if (linhaselecionada >= 0) {
                int idcontato = (int) tabela.getValueAt(linhaselecionada, 0);
                AtualizarProduto ap = new AtualizarProduto(modelo, idcontato, linhaselecionada);
                ap.setVisible(true);
//                System.out.println("Linha selecionada: " + linhaselecionada);
//                System.out.println("Id selecionado: " + idcontato);
            } else {
                JOptionPane.showMessageDialog(null, "É necessário selecionar uma linha!");
            }
        }
    }

    private class btExcluirListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            int linhaselecionada = -1;
            linhaselecionada = tabela.getSelectedRow();
            if (linhaselecionada >= 0) {
                int dialogButton = JOptionPane.YES_NO_OPTION;
                int dialogResult = JOptionPane.showConfirmDialog(null,
                        "Confirma a exclusão do registro?", "Atenção", dialogButton);
                System.out.println("Resultado do dialogo" + dialogResult);
                if (dialogResult == 0) {
                    int idProduto = (int) tabela.getValueAt(linhaselecionada, 0);
                    ProdutoDAO dao = new ProdutoDAO();
                    Resposta resposta = dao.remover(idProduto);
                    modelo.removeRow(linhaselecionada);

                }
            } else {
                JOptionPane.showMessageDialog(null, "É necessário selecionar uma linha!");
            }

        }

    }

    public void criarJTable() {
        tabela = new JTable(modelo);
        tabela.setBackground(Color.white);
        modelo.addColumn("ID");
        modelo.addColumn("Nome");
        modelo.addColumn("Valor");

        tabela.getColumnModel().getColumn(0).setPreferredWidth(10);
        tabela.getColumnModel().getColumn(1).setPreferredWidth(120);
        tabela.getColumnModel().getColumn(2).setPreferredWidth(80);

        tabela.getTableHeader().setReorderingAllowed(false);
        pesquisar(modelo);
    }

    public static void pesquisar(DefaultTableModel model) {
        model.setNumRows(0);
        ProdutoDAO dao = new ProdutoDAO();
        DecimalFormat decimalFormat  =  new DecimalFormat("#0.00");
        for (Produto p : dao.getProdutos()) {
            model.addRow(new Object[]{p.getId(), p.getNome(), "R$ " + decimalFormat.format(p.getValor())});
        }
    }

}

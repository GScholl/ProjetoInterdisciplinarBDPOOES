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
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.WindowConstants;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC-02
 */
public class AdicionarProdutos extends JFrame {

    private JPanel painelFundo;
    private JPanel painelBotoes;
    private JTable tabela;
    private JScrollPane barraRolagem;
    private JButton btAdicionar;
    private ArrayList<Produto> produtos;
    private JButton btVoltar;
    private int id_usuario, id_venda;
    private final DefaultTableModel modelo = new DefaultTableModel();

    public AdicionarProdutos(int idUsuario, ArrayList<Produto> produtosVenda, int id_venda) throws SQLException {
        super("Produtos");
        criarJTable();
        criarJanela();
        this.produtos = produtosVenda;
        this.id_usuario = idUsuario;
        this.id_venda = id_venda;

    }

    public void criarJanela() throws SQLException {
        btAdicionar = new JButton("Adicionar");
        btAdicionar.setBackground(Color.WHITE);
        btAdicionar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btVoltar = new JButton("Voltar");
        btVoltar.setBackground(Color.WHITE);
        btVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        painelBotoes = new JPanel();
        barraRolagem = new JScrollPane(tabela);
        painelFundo = new JPanel();
        painelFundo.setLayout(new BorderLayout());
        painelFundo.add(BorderLayout.CENTER, barraRolagem);
        painelBotoes.add(btAdicionar);
        painelBotoes.add(btVoltar);
        painelFundo.setBackground(Color.white);
        painelFundo.add(BorderLayout.SOUTH, painelBotoes);
        getContentPane().add(painelFundo);
        setResizable(false);

        // Desativa a opção de tela cheia
        setExtendedState(JFrame.NORMAL);

        // Desativa a opção de fechar
        setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
        setSize(500, 320);
        setLocationRelativeTo(null);
        btAdicionar.addActionListener(new btAdicionarListener());

        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btAdicionarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {

            int linhaselecionada = -1;
            linhaselecionada = tabela.getSelectedRow();
            if (linhaselecionada >= 0) {
                ProdutoVenda pv = new ProdutoVenda();
                ProdutoVendaDAO dao = new ProdutoVendaDAO();
                int idProduto = (int) tabela.getValueAt(linhaselecionada, 0);
                pv.setId_venda(id_venda);
                pv.setId_produto(idProduto);
                Resposta resposta = dao.inserirProdutoVenda(pv);
                if (!resposta.isErro()) {
                    JOptionPane.showMessageDialog(null, "Produto adicionado com sucesso!");

                } else {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());

                }
            } else {
                JOptionPane.showMessageDialog(null, "É necessário selecionar uma linha!");
            }
        }
    }

    private class btVoltarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {

            dispose();
            try {
                InserirVenda2 iv2 = new InserirVenda2(id_venda, id_usuario);
                iv2.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(AdicionarProdutos.class.getName()).log(Level.SEVERE, null, ex);
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
        pesquisar(modelo, id_venda);
    }

    public static void pesquisar(DefaultTableModel model, int id_venda) {
        model.setNumRows(0);
        ProdutoDAO dao = new ProdutoDAO();
         DecimalFormat decimalFormat  =  new DecimalFormat("#0.00");
        for (Produto p : dao.getProdutosWhereNotInVenda(id_venda)) {
            
            model.addRow(new Object[]{p.getId(), p.getNome(),"R$ " + decimalFormat.format(p.getValor())});
        }
    }

}

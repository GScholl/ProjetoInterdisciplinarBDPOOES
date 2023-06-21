/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC-02
 */
public final class AtualizarProduto extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbId;
    private JLabel lbNome;
    private JLabel lbValor;
    private JTextField txId;
    private JTextField txNome;
    private JTextField txValor;

    Produto produto;
    private final int linhaselecionada;

    public AtualizarProduto(DefaultTableModel md, int id, int linha) {
        super("Atualizar produto");
        criarJanela();
        modelo = md;
        ProdutoDAO dao = new ProdutoDAO();
        produto = dao.getProdutoByID(id);
        txId.setText(Integer.toString(produto.getId()));
        txNome.setText(produto.getNome());
        txValor.setText(String.valueOf(produto.getValor()));
        linhaselecionada = linha;
    }

    public void criarJanela() {

        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btLimpar = new JButton("Limpar");
        btLimpar.setBackground(Color.WHITE);
        btLimpar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        lbId = new JLabel("Id:");
        lbNome = new JLabel("Nome:");
        lbValor = new JLabel("Valor");
        txId = new JTextField();
        txId.setEditable(false);
        txNome = new JTextField();
        txNome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txValor = new JTextField();
        txValor.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
     
        painelFundo = new JPanel();
        painelFundo.setLayout(new GridLayout(5, 2, 2, 4));
        painelFundo.setBackground(Color.WHITE);
        painelFundo.add(lbId);
        painelFundo.add(txId);
        painelFundo.add(lbNome);
        painelFundo.add(txNome);
        painelFundo.add(lbValor);
        painelFundo.add(txValor);
        painelFundo.add(btLimpar);
        painelFundo.add(btSalvar);

        getContentPane().add(painelFundo);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(400, 250);

        btSalvar.addActionListener(new AtualizarProduto.BtSalvarListener());
        btLimpar.addActionListener(new AtualizarProduto.BtLimparListener());

    }

    private class BtSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            Produto p = new Produto(txNome.getText(), Double.parseDouble(txValor.getText()));
            p.setId(Integer.parseInt(txId.getText()));

            ProdutoDAO dao = new ProdutoDAO();
            dao.atualizar(p);
            modelo.removeRow(linhaselecionada);
            modelo.addRow(new Object[]{p.getId(), p.getNome(), p.getValor()});
            setVisible(false);
        }
    }

    private class BtLimparListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            txNome.setText("");
            txValor.setText("");

        }

    }
}

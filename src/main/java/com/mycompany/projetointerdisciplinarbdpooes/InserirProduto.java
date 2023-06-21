/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import static com.sun.glass.ui.Cursor.setVisible;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC-02
 */
public class InserirProduto extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbNome;
    private JLabel lbValor;

    private JTextField txNome;
    private JTextField txValor;

    public InserirProduto(DefaultTableModel md) {
        super("Inserir Produto");
        criarJanela();
        modelo = md;
    }

    public void criarJanela() {
        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btLimpar = new JButton("Limpar");
        btLimpar.setBackground(Color.WHITE);
        btLimpar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        lbNome = new JLabel("Nome do produto:");
        lbValor = new JLabel("Valor:");

        txNome = new JTextField();
        txNome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txValor = new JTextField();
        txValor.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        painelFundo = new JPanel();
        painelFundo.setLayout(new GridLayout(4, 2, 2, 4));
        painelFundo.add(lbNome);
        painelFundo.add(txNome);
        painelFundo.add(lbValor);
        painelFundo.add(txValor);
        painelFundo.setBackground(Color.WHITE);
        painelFundo.add(btLimpar);
        painelFundo.add(btSalvar);

        getContentPane().add(painelFundo);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(400, 250);
        btSalvar.addActionListener(new btSalvarListener());
        btLimpar.addActionListener(new btLimparListener());

    }

    private class btSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            if (txNome.getText().isEmpty() || txValor.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Dados não preenchidos para inserir produto!");
            } else {
                Produto p = new Produto(txNome.getText(), Double.parseDouble(txValor.getText()));
                ProdutoDAO dao = new ProdutoDAO();
                Resposta resposta = dao.inserirProduto(p);

                if (resposta.isErro()) {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                } else {

                    ListarProdutos.pesquisar(modelo);
                }

                setVisible(false);
            }
        }
    }

    private class btLimparListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            txNome.setText("");
            txValor.setText("");

        }

    }
}

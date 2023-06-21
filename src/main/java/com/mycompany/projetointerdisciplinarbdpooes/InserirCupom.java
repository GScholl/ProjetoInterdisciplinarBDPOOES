/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import static com.mycompany.projetointerdisciplinarbdpooes.AtualizarCupom.txTipoDesconto;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JComboBox;
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
public class InserirCupom extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbCodigoCupom;
    private JLabel lbValorDesconto;
    private JLabel lbTipoDesconto;

    private JTextField txCodigoCupom;
    private JTextField txValorCupom;

    String opcoes[] = {"Selecione", "Em dinheiro", "Em porcentagem"};
    //private JComboBox<Option> txTipoDesconto;
    static JComboBox txTipoDesconto;

    public InserirCupom(DefaultTableModel md) {
        super("Inserir Cupom");
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
        lbCodigoCupom = new JLabel("Código do Cupom:");
        lbValorDesconto = new JLabel("Valor de desconto:");
        lbTipoDesconto = new JLabel("Tipo de desconto:");
        txTipoDesconto = new JComboBox(opcoes);

        txTipoDesconto.setBackground(Color.WHITE);
        txCodigoCupom = new JTextField();
        txCodigoCupom.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txValorCupom = new JTextField();
        txValorCupom.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        painelFundo = new JPanel();
        painelFundo.setLayout(new GridLayout(4, 2, 2, 4));
        painelFundo.add(lbCodigoCupom);
        painelFundo.add(txCodigoCupom);
        painelFundo.add(lbValorDesconto);
        painelFundo.add(txValorCupom);
        painelFundo.add(lbTipoDesconto);
        painelFundo.add(txTipoDesconto);

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
            if (txCodigoCupom.getText().isEmpty() || txTipoDesconto.getSelectedItem().equals("Selecione") || txValorCupom.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Dados não preenchidos para inserir Cupom!");
            } else {

                Cupom c = new Cupom();
                c.setCodigoCupom(txCodigoCupom.getText());
                c.setValorDesconto(Double.parseDouble(txValorCupom.getText()));
                if (txTipoDesconto.getSelectedItem().equals("Em dinheiro")) {
                    c.setTipoDesconto("d");
                } else {
                    c.setTipoDesconto("p");
                }

                CupomDAO dao = new CupomDAO();
                Resposta resposta = dao.inserirCupom(c);

                if (resposta.isErro()) {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                } else {

                    ListarCupons.pesquisar(modelo);
                }

                setVisible(false);
            }
        }
    }

    private class btLimparListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            txTipoDesconto.setSelectedItem(opcoes[0]);
            txValorCupom.setText("");
            txCodigoCupom.setText("");

        }

    }

}

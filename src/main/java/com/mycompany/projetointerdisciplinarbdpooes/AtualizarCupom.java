/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import static com.mycompany.projetointerdisciplinarbdpooes.InserirCupom.txTipoDesconto;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.DefaultComboBoxModel;
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
public class AtualizarCupom extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbId;
    private JLabel lbNome;
    private JLabel lbValor;
    private JLabel lbTipoDesconto;
    private JTextField txId;
    private JTextField txCodigoCupom;
    private JTextField txValorDesconto;
    String opcoes[] = {"Selecione", "Em dinheiro", "Em porcentagem"};
    //private JComboBox<Option> txTipoDesconto;
    static JComboBox txTipoDesconto;
    private int opcaoPreSelecionada;

    Cupom cupom;
    private final int linhaselecionada;

    public AtualizarCupom(DefaultTableModel md, int id, int linha) {
        super("Atualizar cupom");

        modelo = md;
        CupomDAO dao = new CupomDAO();
        cupom = dao.getCupomByID(id);
        if (cupom.getTipoDesconto().equals("d")) {
            opcaoPreSelecionada = 1;

        } else if (cupom.getTipoDesconto().equals("p")) {
            opcaoPreSelecionada = 2;

        } else {
            opcaoPreSelecionada = 0;
        }
        criarJanela();

        txId.setText(Integer.toString(cupom.getId()));
        txCodigoCupom.setText(cupom.getCodigoCupom());
        txValorDesconto.setText(String.valueOf(cupom.getValorDesconto()));
        System.out.println(txTipoDesconto.getSelectedItem());

        linhaselecionada = linha;
    }

    public void criarJanela() {

        // create checkbox
        txTipoDesconto = new JComboBox(opcoes);
        System.out.println(opcaoPreSelecionada);
        txTipoDesconto.setSelectedItem(opcoes[opcaoPreSelecionada]);
        txTipoDesconto.setBackground(Color.WHITE);
        // txTipoDesconto.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btLimpar = new JButton("Limpar");
        btLimpar.setBackground(Color.WHITE);
        btLimpar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        lbId = new JLabel("Id:");
        lbNome = new JLabel("Código:");
        lbValor = new JLabel("Valor");
        lbTipoDesconto = new JLabel("Selecione o tipo de desconto");
        txId = new JTextField();
        txId.setEditable(false);

        txCodigoCupom = new JTextField();
        txCodigoCupom.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txValorDesconto = new JTextField();
        txValorDesconto.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        painelFundo = new JPanel();
        painelFundo.setLayout(new GridLayout(5, 2, 2, 4));
        painelFundo.setBackground(Color.WHITE);
        painelFundo.add(lbId);
        painelFundo.add(txId);
        painelFundo.add(lbNome);
        painelFundo.add(txCodigoCupom);
        painelFundo.add(lbValor);
        painelFundo.add(txValorDesconto);
        painelFundo.add(lbTipoDesconto);
        painelFundo.add(txTipoDesconto);
        painelFundo.add(btLimpar);
        painelFundo.add(btSalvar);

        getContentPane().add(painelFundo);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(400, 250);

        btSalvar.addActionListener(new AtualizarCupom.BtSalvarListener());
        btLimpar.addActionListener(new AtualizarCupom.BtLimparListener());

    }

    private class BtSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {

            if (txCodigoCupom.getText().isEmpty() || txTipoDesconto.getSelectedItem().equals("Selecione") || txValorDesconto.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Dados não preenchidos para inserir Cupom!");
            } else {
                Cupom c = new Cupom();;
                c.setId(Integer.parseInt(txId.getText()));
                c.setCodigoCupom(txCodigoCupom.getText());
                c.setValorDesconto(Double.parseDouble(txValorDesconto.getText()));
                if (txTipoDesconto.getSelectedItem().equals("Em dinheiro")) {
                    c.setTipoDesconto("d");
                    c.setLegendaDesconto(String.valueOf(txTipoDesconto.getSelectedItem()));
                } else {
                    c.setTipoDesconto("p");
                     c.setLegendaDesconto(String.valueOf(txTipoDesconto.getSelectedItem()));
                }

                CupomDAO dao = new CupomDAO();
                dao.atualizar(c);
                modelo.removeRow(linhaselecionada);
                modelo.addRow(new Object[]{c.getId(), c.getCodigoCupom(), c.getValorDesconto(), c.getLegendaDesconto()});
                setVisible(false);

            }

        }
    }

    private class BtLimparListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            txCodigoCupom.setText("");
            txValorDesconto.setText("");
            txTipoDesconto.setSelectedItem(opcoes[0]);

        }

    }

}

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
import java.text.ParseException;
import javax.swing.JButton;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import static javax.swing.WindowConstants.DISPOSE_ON_CLOSE;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.MaskFormatter;

/**
 *
 * @author PC-02
 */
public class AtualizarCliente extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar, btLimpar;
    private JLabel lbId,lbNome,lbSobrenome,lbEmail,lbTelefone,lbCep,lbCpf;
    private JTextField txId,txNome,txSobrenome,txEmail,txTelefone,txCep,txCpf;
    Cliente cliente;
    private final int linhaselecionada;

    public AtualizarCliente(DefaultTableModel md, int id, int linha) throws ParseException {
        super("Atualizar cliente");
        criarJanela();
        modelo = md;
        ClienteDAO dao = new ClienteDAO();
        cliente = dao.getClienteByID(id);
        txId.setText(Integer.toString(cliente.getId()));
        txNome.setText(cliente.getNome());
        txSobrenome.setText(cliente.getSobrenome());
        txEmail.setText(cliente.getEmail());
        txTelefone.setText(cliente.getTelefone());
        txCep.setText(cliente.getCep());
        txCpf.setText(cliente.getCpf());
        linhaselecionada = linha;
    }

    public void criarJanela() throws ParseException {

        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btLimpar = new JButton("Limpar");
        btLimpar.setBackground(Color.WHITE);
        btLimpar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        lbId = new JLabel("Id:");
        lbNome = new JLabel("Nome:");
        lbSobrenome = new JLabel("Sobrenome:");
        lbEmail = new JLabel("E-mail:");
        lbTelefone = new JLabel("Telefone:");
        lbCep = new JLabel("Cep:");
        lbCpf = new JLabel("Cpf:");
        txId = new JTextField();
        txId.setEditable(false);
        txNome = new JTextField();
        txNome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txSobrenome = new JTextField();
        txSobrenome.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txEmail = new JTextField();
        txEmail.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txTelefone = new JFormattedTextField(new MaskFormatter("(##)#####-####"));
        txTelefone.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txCep = new JFormattedTextField(new MaskFormatter("#####-###"));
        txCep.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        txCpf = new JFormattedTextField(new MaskFormatter("###.###.###-##"));
        txCpf.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        painelFundo = new JPanel();
        painelFundo.setLayout(new GridLayout(5, 2, 2, 4));
        painelFundo.setBackground(Color.WHITE);
        painelFundo.add(lbId);
        painelFundo.add(txId);
        painelFundo.add(lbNome);
        painelFundo.add(txNome);
        painelFundo.add(lbSobrenome);
        painelFundo.add(txSobrenome);
        painelFundo.add(lbEmail);
        painelFundo.add(txEmail);
        painelFundo.add(lbTelefone);
        painelFundo.add(txTelefone);
        painelFundo.add(lbCep);
        painelFundo.add(txCep);
        painelFundo.add(lbCpf);
        painelFundo.add(txCpf);
        painelFundo.add(btLimpar);
        painelFundo.add(btSalvar);

        getContentPane().add(painelFundo);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(400, 250);

        btSalvar.addActionListener(new AtualizarCliente.BtSalvarListener());
        btLimpar.addActionListener(new AtualizarCliente.BtLimparListener());

    }

    private class BtSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent e) {
            Cliente c = new Cliente(txNome.getText(), txSobrenome.getText(), txEmail.getText());
            c.setId(Integer.parseInt(txId.getText()));
            c.setTelefone(txTelefone.getText());
            c.setCep(txCep.getText());
            c.setCpf(txCpf.getText());
            

            ClienteDAO dao = new ClienteDAO();
           Resposta resposta =  dao.atualizar(c);
           JOptionPane.showMessageDialog(null,resposta.getMensagem_erro());
            modelo.removeRow(linhaselecionada);
            modelo.addRow(new Object[]{c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getTelefone(), c.getCep(), c.getCpf()});
            setVisible(false);
        }
    }

    private class BtLimparListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            txNome.setText("");
            txSobrenome.setText("");
            txEmail.setText("");
            txTelefone.setText("");
            txCep.setText("");
            txCpf.setText("");

        }

    }

}

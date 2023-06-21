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
public class InserirCliente extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbNome;
    private JLabel lbSobrenome;
    private JLabel lbEmail;
    private JLabel lbTelefone;
    private JLabel lbCep;
    private JLabel lbCpf;

    private JTextField txNome;
    private JTextField txSobrenome;
    private JTextField txEmail;
    private JTextField txTelefone;
    private JTextField txCep;
    private JTextField txCpf;

    public InserirCliente(DefaultTableModel md) throws ParseException {
        super("Inserir Cliente");
        criarJanela();
        modelo = md;
    }

    public void criarJanela() throws ParseException {
        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btLimpar = new JButton("Limpar");
        btLimpar.setBackground(Color.WHITE);
        btLimpar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        lbNome = new JLabel("Nome:");
        lbSobrenome = new JLabel("Sobrenome:");
        lbEmail = new JLabel("E-mail:");
        lbTelefone = new JLabel("Telefone");
        lbCep = new JLabel("Cep:");
        lbCpf = new JLabel("CPF:");

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
        painelFundo.setLayout(new GridLayout(4, 2, 2, 4));
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
            if (txNome.getText().isEmpty() || txSobrenome.getText().isEmpty() || txEmail.getText().isEmpty() || txTelefone.getText().isEmpty() || txCep.getText().isEmpty() || txCpf.getText().isEmpty()) {
                JOptionPane.showMessageDialog(null, "Dados não preenchidos para inserir cliente!");
            } else {
                Verificador verify = new Verificador();

                if (!verify.verificaTamanhoCampo(txNome, 3, 64)) {
                    JOptionPane.showMessageDialog(null, "O nome precisa conter no minimo 3 caracteres e no máximo 64");
                    return;
                }
                if (!verify.verificaTamanhoCampo(txSobrenome, 3, 64)) {
                    JOptionPane.showMessageDialog(null, "O sobrenome precisa conter no minimo 3 caracteres e no máximo 64");
                    return;
                }
                if (verify.verificaCaracteresEspeciais(txNome.getText()) || verify.verificaCaracteresEspeciais(txSobrenome.getText()) || verify.verificaNumeros(txNome.getText()) || verify.verificaNumeros(txSobrenome.getText())) {
                    JOptionPane.showMessageDialog(null, "Nome e sobrenome não podem conter números ou caracteres especiais");
                    return;
                }
                if (!verify.isCPF(txCpf.getText().replace(".", "").replace("-", ""))) {
                    JOptionPane.showMessageDialog(null, "O CPF não é um CPF Válido");
                    return;
                }
                if (!verify.verificaEmail(txEmail.getText())) {
                    JOptionPane.showMessageDialog(null, "E-mail não é válido");
                    return;
                }

                if (!verify.verificaTamanhoCampo(txEmail, 6, 36)) {
                    JOptionPane.showMessageDialog(null, "E-mail precisa conter no minimo 6 caracteres e no máximo 36! ");
                    return;
                }
                Cliente c = new Cliente(txNome.getText(), txSobrenome.getText(), txEmail.getText());
                c.setTelefone(txTelefone.getText());
                c.setCep(txCep.getText());
                c.setCpf(txCpf.getText());
                
                ClienteDAO dao = new ClienteDAO();
                Resposta resposta = dao.inserirCliente(c);

                if (resposta.isErro()) {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                } else {

                    ListarClientes.pesquisar(modelo);
                }

                setVisible(false);
            }
        }
    }

    private class btLimparListener implements ActionListener {

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

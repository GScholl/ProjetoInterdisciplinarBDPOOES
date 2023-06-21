/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.WindowConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author PC-02
 */
public class InserirVenda extends JFrame {

    private DefaultTableModel modelo = new DefaultTableModel();
    private JPanel painelFundo;
    private JButton btSalvar;
    private JButton btLimpar;
    private JLabel lbNome, lbCliente;
    private JComboBox clientes;

    private JTextField txNome;
    private JTextField txValor;
    private int idUsuario;
    private ArrayList<Cliente> itemList;

    public InserirVenda(DefaultTableModel md, int id_usuario) {
        super("Inserir Venda");
        criarJanela();
        this.idUsuario = id_usuario;
        modelo = md;
    }

    public void criarJanela() {
        itemList = new ArrayList<>();
        btSalvar = new JButton("Próxima Etapa");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        lbCliente = new JLabel("Selecione o Cliente:");

        clientes = new JComboBox<>();

        ClienteDAO clientedao = new ClienteDAO();

        for (Cliente c : clientedao.getClientes()) {
            clientes.addItem(c.getNome() + " " + c.getSobrenome());
            itemList.add(c);
        }
        clientes.setBackground(Color.WHITE);
       
        painelFundo = new JPanel();
        painelFundo.setBorder(new EmptyBorder(10, 10, 10, 10));
        painelFundo.setLayout(new FlowLayout(FlowLayout.CENTER, 10, 10));
        painelFundo.setBackground(Color.WHITE);

        painelFundo.add(lbCliente);
        painelFundo.add(clientes);

        painelFundo.add(btSalvar);

        getContentPane().add(painelFundo);
        setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
        setSize(400, 200);

        btSalvar.addActionListener(new btSalvarListener());

    }

    private class btSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {

            Venda venda = new Venda();
            int itemescolhido = clientes.getSelectedIndex();
            System.out.println(itemList.get(itemescolhido).getId());
            venda.setIdCliente(itemList.get(itemescolhido).getId());
            venda.setIdUsuario(idUsuario);
            VendaDAO dao = new VendaDAO();
            int id_venda = dao.inserirVenda(venda);
            if (id_venda != 0) {
                dispose();
                InserirVenda2 etapa2;
                try {
                    etapa2 = new InserirVenda2(id_venda, idUsuario);
                    etapa2.setVisible(true);
                } catch (SQLException ex) {
                    Logger.getLogger(InserirVenda.class.getName()).log(Level.SEVERE, null, ex);
                }

            } else {

            }

        }

    }

}

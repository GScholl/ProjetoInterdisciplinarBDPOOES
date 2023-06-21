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
import java.text.ParseException;
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
public class ListarVendas extends JFrame {

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

    public ListarVendas(int idUsuario) throws SQLException, ParseException {
        super("Vendas");
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
        btInserir = new JButton("Criar nova venda");
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
        painelBotoes.add(btExcluir);
        painelBotoes.add(btVoltar);
        painelFundo.setBackground(Color.white);
        painelFundo.add(BorderLayout.SOUTH, painelBotoes);
        getContentPane().add(painelFundo);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(900, 520);
        setLocationRelativeTo(null);
        btInserir.addActionListener(new btInserirListener());
        
        btExcluir.addActionListener(new btExcluirListener());
        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btInserirListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            InserirVenda iv = new InserirVenda(modelo, id_usuario);
            iv.setVisible(true);
            dispose();

        }
    }

    private class btVoltarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {

            try {
                DashBoard ds = new DashBoard(id_usuario);
                dispose();
                ds.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(ListarVendas.class.getName()).log(Level.SEVERE, null, ex);
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
                    int idVenda = (int) tabela.getValueAt(linhaselecionada, 0);
                    VendaDAO dao = new VendaDAO();
                    Resposta resposta = dao.remover(idVenda);
                    modelo.removeRow(linhaselecionada);

                }
            } else {
                JOptionPane.showMessageDialog(null, "É necessário selecionar uma linha!");
            }

        }

    }

    public void criarJTable() throws ParseException {
        tabela = new JTable(modelo);
        tabela.setBackground(Color.white);
        modelo.addColumn("ID");
        //modelo.addColumn("Nome");
        modelo.addColumn("Valor Bruto");
        modelo.addColumn("Valor Liquido");
        modelo.addColumn("id_cupom");
        modelo.addColumn("Código do Cupom");
        modelo.addColumn("id_cliente");
        modelo.addColumn("Nome do cliente");
        modelo.addColumn("Forma de pagamento");
        modelo.addColumn("Data da compra");
        modelo.addColumn("Nome do vendedor");
        modelo.addColumn("id_usuario");
        tabela.setBackground(Color.WHITE);
        tabela.getColumnModel().getColumn(0).setPreferredWidth(5);
        tabela.getColumnModel().getColumn(1).setPreferredWidth(60);
        tabela.getColumnModel().getColumn(2).setPreferredWidth(60);
        tabela.getColumnModel().getColumn(3).setMinWidth(0);
        tabela.getColumnModel().getColumn(3).setMaxWidth(0);
        tabela.getColumnModel().getColumn(3).setWidth(0);
        tabela.getColumnModel().getColumn(4).setPreferredWidth(60);
        tabela.getColumnModel().getColumn(5).setMinWidth(0);
        tabela.getColumnModel().getColumn(5).setMaxWidth(0);
        tabela.getColumnModel().getColumn(5).setWidth(0);
        tabela.getColumnModel().getColumn(6).setPreferredWidth(160);
        tabela.getColumnModel().getColumn(7).setPreferredWidth(80);
        tabela.getColumnModel().getColumn(8).setPreferredWidth(120);
        tabela.getColumnModel().getColumn(9).setPreferredWidth(160);
        tabela.getColumnModel().getColumn(10).setMinWidth(0);
        tabela.getColumnModel().getColumn(10).setMaxWidth(0);
        tabela.getColumnModel().getColumn(10).setWidth(0);
        tabela.getTableHeader().setReorderingAllowed(false);
        pesquisar(modelo);
    }

    public static void pesquisar(DefaultTableModel model) throws ParseException {
        model.setNumRows(0);
        VendaDAO dao = new VendaDAO();
        for (Venda v : dao.getVendas()) {
            DecimalFormat decimalFormat = new DecimalFormat("#0.00");

            model.addRow(new Object[]{
                v.getId(),
                "R$ " + decimalFormat.format(v.getValorBruto()),
                "R$ " + decimalFormat.format(v.getValorLiquido()),
                v.getId_cupom(),
                v.getCodigoCupom(),
                v.getIdCliente(),
                v.getNomeCliente(),
                v.getFormaPagamentoFormatado(v.getFormaPagamento()),
                v.getDataCompra(),
                v.getNomeUsuario(),
                v.getIdUsuario()
            });
        }
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import static com.sun.xml.internal.fastinfoset.alphabet.BuiltInRestrictedAlphabets.table;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import static javax.swing.JFrame.EXIT_ON_CLOSE;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.text.DefaultFormatterFactory;
import javax.swing.text.MaskFormatter;

/**
 *
 * @author PC-02
 */
public class ListarClientes extends JFrame {

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

    public ListarClientes(int idUsuario) throws SQLException, ParseException {
        super("Clientes");
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
        setSize(700, 450);
        setLocationRelativeTo(null);
        btInserir.addActionListener(new btInserirListener());
        btAlterar.addActionListener(new btAlterarListener());
        btExcluir.addActionListener(new btExcluirListener());
        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btInserirListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            InserirCliente ic;
            try {
                ic = new InserirCliente(modelo);ic.setVisible(true);
                ic.setVisible(true);
                
            } catch (ParseException ex) {
                Logger.getLogger(ListarClientes.class.getName()).log(Level.SEVERE, null, ex);
            }
            
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
                AtualizarCliente ap;
                try {
                    ap = new AtualizarCliente(modelo, idcontato, linhaselecionada);
                    ap.setVisible(true);
                } catch (ParseException ex) {
                    Logger.getLogger(ListarClientes.class.getName()).log(Level.SEVERE, null, ex);
                }
                
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
                    int idCliente = (int) tabela.getValueAt(linhaselecionada, 0);
                    ClienteDAO dao = new ClienteDAO();
                    Resposta resposta = dao.remover(idCliente);
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
        // Cria um MaskFormatter para a máscara do CPF
        MaskFormatter cpfFormatter = new MaskFormatter("###.###.###-##");
        cpfFormatter.setPlaceholderCharacter('_');

        // Cria um DefaultFormatterFactory com o MaskFormatter
        DefaultFormatterFactory formatterFactory = new DefaultFormatterFactory(cpfFormatter);

        // Define o formatterFactory como o formatador para a coluna de CPF
        // table.getColumnModel().getColumn(0).setCellEditor(new DefaultCellEditor(new JFormattedTextField(formatterFactory)));
        modelo.addColumn("id");
        modelo.addColumn("Nome");
        modelo.addColumn("sobrenome");
        modelo.addColumn("E-mail");
        modelo.addColumn("Telefone");
        modelo.addColumn("Cep");
        modelo.addColumn("Cpf");

        tabela.getColumnModel().getColumn(0).setPreferredWidth(10);
        tabela.getColumnModel().getColumn(1).setPreferredWidth(80);
        tabela.getColumnModel().getColumn(2).setPreferredWidth(80);
        tabela.getColumnModel().getColumn(3).setPreferredWidth(180);
        tabela.getColumnModel().getColumn(4).setPreferredWidth(60);
        tabela.getColumnModel().getColumn(5).setPreferredWidth(60);
        tabela.getColumnModel().getColumn(6).setCellEditor(new DefaultCellEditor(new JFormattedTextField(formatterFactory)));

        tabela.getTableHeader().setReorderingAllowed(false);
        pesquisar(modelo);
    }

    public static void pesquisar(DefaultTableModel model) {
        model.setNumRows(0);
        ClienteDAO dao = new ClienteDAO();
        for (Cliente c : dao.getClientes()) {
            model.addRow(new Object[]{c.getId(), c.getNome(), c.getSobrenome(), c.getEmail(), c.getTelefone(), c.getCep(), c.getCpf()});
        }
    }
}

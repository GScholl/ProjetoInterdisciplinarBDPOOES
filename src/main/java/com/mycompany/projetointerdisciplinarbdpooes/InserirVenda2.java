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
import javax.swing.JLabel;
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
public class InserirVenda2 extends JFrame {

    private int id_venda, id_usuario;
    private double valor_subtotal;
    private JButton btAdicionar, btProximaEtapa, btVoltar;
    private JLabel nome_cliente, nome_usuario, subtotal;
    private JPanel painelBotoes, painelFundo, painelDados;
    private JScrollPane barraRolagem;
    private JTable tabela;
    private final DefaultTableModel modelo = new DefaultTableModel();
    private ArrayList<Produto> produtosVenda;
    private DecimalFormat decimalFormat;

    public InserirVenda2(int idVenda, int idUsuario) throws SQLException {
        super("Adicionar produtos na venda");
        this.id_usuario = idUsuario;
        this.id_venda = idVenda;
        criarJTable();
        criarJanela();

    }

    public void criarJanela() throws SQLException {

        ProdutoDAO pdao = new ProdutoDAO();

        valor_subtotal = pdao.subtotalVenda(id_venda);
        decimalFormat = new DecimalFormat("#0.00");

        subtotal = new JLabel("Subtotal: R$ " + decimalFormat.format(valor_subtotal));
        btAdicionar = new JButton("Adicionar");
        btAdicionar.setBackground(Color.WHITE);
        btAdicionar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btProximaEtapa = new JButton("Próxima Etapa");
        btProximaEtapa.setBackground(Color.WHITE);
        btProximaEtapa.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        btVoltar = new JButton("Cancelar");
        btVoltar.setBackground(Color.WHITE);
        btVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        painelBotoes = new JPanel();
        barraRolagem = new JScrollPane(tabela);
        painelFundo = new JPanel();
        painelFundo.setLayout(new BorderLayout());
        painelFundo.add(BorderLayout.CENTER, barraRolagem);
        painelBotoes.add(subtotal);
        painelBotoes.add(btAdicionar);
        painelBotoes.add(btProximaEtapa);
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
        btProximaEtapa.addActionListener(new btProximaEtapaListener());
        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btProximaEtapaListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            try {
                if(valor_subtotal > 0){
                VendaDAO vendadao = new VendaDAO();
                Venda venda = new Venda();
                venda.setId(id_venda);
                venda.setValorBruto(valor_subtotal);
                venda.setValorLiquido(valor_subtotal);
                Resposta resposta = vendadao.UpdateSegundaEtapaVenda(venda);
                if (!resposta.isErro()) {
                    dispose();

                    InserirVenda3 iv3 = new InserirVenda3(id_venda,id_usuario);
                    iv3.setVisible(true);
                } else {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                }
                }else{
                    
                   JOptionPane.showMessageDialog(null,"Selecione pelo menos um produto para continuar!");
                }
            } catch (SQLException ex) {
                Logger.getLogger(InserirVenda2.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InterruptedException ex) {
                Logger.getLogger(InserirVenda2.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    private class btAdicionarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            try {
                dispose();
                AdicionarProdutos ap = new AdicionarProdutos(id_usuario, produtosVenda, id_venda);
                ap.setVisible(true);
            } catch (SQLException ex) {
                Logger.getLogger(InserirVenda2.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    private class btVoltarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            int linhaselecionada = -1;
            linhaselecionada = tabela.getSelectedRow();
            int dialogButton = JOptionPane.YES_NO_OPTION;
            int dialogResult = JOptionPane.showConfirmDialog(null,
                    "Confirma o cancelamento da Venda?", "Atenção", dialogButton);

            if (dialogResult == 0) {

                VendaDAO dao = new VendaDAO();
                Resposta resposta = dao.remover(id_venda);
                if (!resposta.isErro()) {
                    dispose();
                } else {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                }

            }

        }
    }

    public void criarJTable() {
        tabela = new JTable(modelo);
        tabela.setBackground(Color.white);
        modelo.addColumn("ID");
        modelo.addColumn("Quantidade");
        modelo.addColumn("Nome");
        modelo.addColumn("Valor Unitário");
        modelo.addColumn("Valor Total");

        tabela.getColumnModel().getColumn(0).setPreferredWidth(10);
        tabela.getColumnModel().getColumn(1).setPreferredWidth(50);
        tabela.getColumnModel().getColumn(2).setPreferredWidth(120);
        tabela.getColumnModel().getColumn(3).setPreferredWidth(80);
        tabela.getColumnModel().getColumn(4).setPreferredWidth(80);

        tabela.getTableHeader().setReorderingAllowed(false);
        pesquisar(modelo, id_venda);
    }

    public static void pesquisar(DefaultTableModel model, int id_venda) {
        model.setNumRows(0);
        ProdutoDAO dao = new ProdutoDAO();
        for (Produto p : dao.getProdutosWhereInVenda(id_venda)) {
            DecimalFormat decimalFormat = new DecimalFormat("#0.00");
            String valorTotal = decimalFormat.format(p.getValorTotal());
            String valor = decimalFormat.format(p.getValor());
            model.addRow(new Object[]{p.getId(), p.getQtd(), p.getNome(), valor, valorTotal});
        }
    }
}

package com.mycompany.projetointerdisciplinarbdpooes;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.WindowConstants;
import javax.swing.border.EmptyBorder;

public class InserirVenda3 extends JFrame {

    private int id_venda, id_usuario, id_cupom;
    private JButton btSalvar, btVoltar, btValidaCupom;
    private JLabel nome_cliente, nome_usuario, subtotal, espacoEmBranco, cupomDesconto, FormaPagamento, desconto, valor_inicial;
    private JPanel painelBotoes, painelFundo, painelDados, painelConta;
    private JTextField txCodigoCupom;
    private JComboBox<String> txTipoPagamento;
    private double valor_subtotal, valorDesconto, valorInicial;
    private DecimalFormat decimalFormat;

    public InserirVenda3(int idVenda, int idUsuario) throws SQLException, InterruptedException {
        super("Checkout");
        this.id_usuario = idUsuario;
        this.id_venda = idVenda;
        System.out.println(id_usuario + " " + id_venda);
        criarJanela();
    }

    public void criarJanela() throws SQLException, InterruptedException {
        ProdutoDAO pdao = new ProdutoDAO();
        VendaDAO vdao = new VendaDAO();
        Venda venda = vdao.getvendaByID(id_venda);
        nome_cliente = new JLabel("Nome do Cliente: " + venda.getNomeCliente());
        nome_usuario = new JLabel("Nome do vendedor: " + venda.getNomeUsuario());

        valor_subtotal = pdao.subtotalVenda(id_venda);
        valorInicial = valor_subtotal;
        decimalFormat = new DecimalFormat("#0.00");
        valor_inicial = new JLabel("Valor inicial: R$ " + decimalFormat.format(valorInicial));
        desconto = new JLabel("Desconto: - R$ " + decimalFormat.format(0));
        subtotal = new JLabel("Subtotal: R$ " + decimalFormat.format(valor_subtotal));
        btSalvar = new JButton("Salvar");
        btSalvar.setBackground(Color.WHITE);
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btVoltar = new JButton("Cancelar");
        btVoltar.setBackground(Color.WHITE);
        btVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        FormaPagamento = new JLabel("Forma De Pagamento:");
        txTipoPagamento = new JComboBox<>(new String[]{"Selecione", "Crédito", "Débito", "Pix"});
        cupomDesconto = new JLabel("Código do cupom de desconto:");
        txCodigoCupom = new JTextField();
        btValidaCupom = new JButton("Validar Cupom");
        btValidaCupom.setBackground(Color.WHITE);
        btValidaCupom.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        espacoEmBranco = new JLabel(" ");
        painelDados = new JPanel(new GridLayout(5, 2, 2, 4));
        painelDados.setBorder(new EmptyBorder(10, 10, 10, 10));
        painelDados.add(nome_cliente);
        painelDados.add(nome_usuario);
        painelDados.add(FormaPagamento);
        painelDados.add(txTipoPagamento);
        painelDados.add(cupomDesconto);
        painelDados.add(txCodigoCupom);
        painelDados.add(espacoEmBranco);
        painelDados.add(btValidaCupom);

        painelBotoes = new JPanel(new GridLayout(1, 2, 10, 10));
        painelBotoes.add(btSalvar);
        painelBotoes.add(btVoltar);

        painelFundo = new JPanel(new BorderLayout());
        painelFundo.setBackground(Color.WHITE);
        painelFundo.add(painelDados, BorderLayout.NORTH);
        painelConta = new JPanel(new BorderLayout());
        painelConta.setBackground(Color.WHITE);
        painelConta.setBorder(new EmptyBorder(10, 10, 10, 10));
        painelConta.add(valor_inicial, BorderLayout.NORTH);
        painelConta.add(desconto, BorderLayout.CENTER);
        painelConta.add(subtotal, BorderLayout.SOUTH);
        painelFundo.add(painelConta, BorderLayout.CENTER);
        painelFundo.add(painelBotoes, BorderLayout.SOUTH);

        // Aplicar borda redonda aos botões
        btSalvar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));
        btVoltar.setBorder(new BordaRedonda(Color.LIGHT_GRAY, 10));

        getContentPane().add(painelFundo);
        setResizable(false);
        setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
        setSize(600, 400);
        setLocationRelativeTo(null);
        btValidaCupom.addActionListener(new btValidarListener());
        btSalvar.addActionListener(new btSalvarListener());
        btVoltar.addActionListener(new btVoltarListener());
    }

    private class btValidarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {

            if (txCodigoCupom.getText().length() < 3) {
                JOptionPane.showMessageDialog(null, "É necessário digitar pelo menos 3 digitos para validar um cupom");

            } else {
                CupomDAO cdao = new CupomDAO();
                System.out.println(txCodigoCupom.getText());
                Cupom cupom = cdao.buscarCupomPeloCodigo(txCodigoCupom.getText());
                if (cupom != null) {
                    id_cupom = cupom.getId();
                    if (cupom.getTipoDesconto().equals("p")) {
                        if (cupom.getValorDesconto() > 90) {

                            valor_subtotal = valorInicial - (valorInicial * 90 / 100);
                            System.out.println(valor_subtotal);
                            desconto.setText("Desconto: - 90.00%(desconto máximo)");
                            subtotal.setText(String.valueOf("Subtotal: R$ " + decimalFormat.format(valor_subtotal)));
                        } else {
                            valor_subtotal = valorInicial - (valorInicial * cupom.getValorDesconto() / 100);
                            desconto.setText("Desconto: - " + decimalFormat.format(cupom.getValorDesconto()) + "%");
                            subtotal.setText(String.valueOf("Subtotal: R$ " + decimalFormat.format(valor_subtotal)));
                        }

                    } else {
                        if (cupom.getValorDesconto() > valorInicial) {
                            valor_subtotal = valorInicial - (valorInicial * 90 / 100);
                            desconto.setText("Desconto: - 90.00%(desconto máximo)");
                            subtotal.setText(String.valueOf("Subtotal: R$ " + decimalFormat.format(valor_subtotal)));
                        } else {
                            valor_subtotal = valorInicial - cupom.getValorDesconto();
                            desconto.setText("Desconto: - R$ " + decimalFormat.format(cupom.getValorDesconto()));
                            subtotal.setText(String.valueOf("Subtotal: R$ " + decimalFormat.format(valor_subtotal)));

                        }
                    }

                } else {
                    JOptionPane.showMessageDialog(null, "Cupom não encontrado!");
                }
            }
        }

    }

    private class btSalvarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            if (txTipoPagamento.getSelectedItem().equals("Selecione")) {
                System.out.println("Por favor, selecione uma opção de pagamento");
            } else {
                System.out.println(id_cupom);
                Venda venda = new Venda();
                venda.setId(id_venda);
                String forma_pagamento = "";
                if (txTipoPagamento.getSelectedItem().equals("Crédito")) {
                    forma_pagamento = "C";
                } else if (txTipoPagamento.getSelectedItem().equals("Débito")) {
                    forma_pagamento = "D";
                } else if (txTipoPagamento.getSelectedItem().equals("Pix")) {
                    forma_pagamento = "P";
                }
                venda.setFormaPagamento(forma_pagamento);

                if (txCodigoCupom.getText().length() > 3 && valor_subtotal != valorInicial) {
                    venda.setCodigoCupom(txCodigoCupom.getText());
                    venda.setValorBruto(valorInicial);
                    venda.setValorLiquido(valor_subtotal);
                    venda.setId_cupom(id_cupom);
                    System.out.println("id_cupom" + id_cupom);
                } else {
                    venda.setCodigoCupom("");
                    venda.setValorBruto(valorInicial);
                    venda.setValorLiquido(valor_subtotal);
                    venda.setId_cupom(0);

                }
                VendaDAO vdao = new VendaDAO();
                Resposta resposta = vdao.UpdateUltimaEtapaVenda(venda);

                if (resposta.isErro()) {
                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                    dispose();
                    try {
                        ListarVendas lv = new ListarVendas(id_usuario);
                        lv.setVisible(true);
                    } catch (SQLException ex) {
                        Logger.getLogger(InserirVenda3.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ParseException ex) {
                        Logger.getLogger(InserirVenda3.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {

                    JOptionPane.showMessageDialog(null, resposta.getMensagem_erro());
                    dispose();
                    try {
                        ListarVendas lv = new ListarVendas(id_usuario);
                        lv.setVisible(true);
                    } catch (SQLException ex) {
                        Logger.getLogger(InserirVenda3.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ParseException ex) {
                        Logger.getLogger(InserirVenda3.class.getName()).log(Level.SEVERE, null, ex);
                    }

                }

            }
        }
    }

    private class btVoltarListener implements ActionListener {

        @Override
        public void actionPerformed(ActionEvent ae) {
            int dialogButton = JOptionPane.YES_NO_OPTION;
            int dialogResult = JOptionPane.showConfirmDialog(null, "Confirma o cancelamento da Venda?", "Atenção", dialogButton);

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
}

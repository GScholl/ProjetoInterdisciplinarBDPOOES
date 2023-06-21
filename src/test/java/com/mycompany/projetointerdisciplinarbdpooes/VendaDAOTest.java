/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

import java.util.ArrayList;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 *
 * @author PC-02
 */
public class VendaDAOTest {

    private VendaDAO dao;

    public VendaDAOTest() {
    }

    @BeforeAll
    public static void setUpClass() {

    }

    @AfterAll
    public static void tearDownClass() {
    }

    @BeforeEach
    public void setUp() {
        dao = new VendaDAO();
    }

    @AfterEach
    public void tearDown() {
    }

    /**
     * Testando se o numero de faturamento nos ultimos 30 dias é maior ou igual
     * a 0
     */
    @Test
    public void testFaturamentoUltimos30() {
        System.out.println("FaturamentoUltimos30");
        VendaDAO instance = new VendaDAO();
        double expResult = 0.0;
        double result = instance.FaturamentoUltimos30();
        assertTrue(0 <= result);

    }

    /**
     * Testando se o número de vendas dos ultimos 30 dias é maior ou igual a 0
     */
    @Test
    public void testNumVendasUltimos30() {
        System.out.println("NumVendasUltimos30");
        VendaDAO instance = new VendaDAO();

        int resultado = instance.NumVendasUltimos30();
        assertTrue(0 <= resultado);
    }

    /**
     * Test of UpdateUltimaEtapaVenda method, of class VendaDAO.
     */
    @Test
    public void testUpdateUltimaEtapaVenda() {
        System.out.println("UpdateUltimaEtapaVenda");
        Venda venda = null;
        VendaDAO instance = new VendaDAO();
        Resposta expResult = null;
        Resposta result = instance.UpdateUltimaEtapaVenda(venda);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of UpdateSegundaEtapaVenda method, of class VendaDAO.
     */
    @Test
    public void testUpdateSegundaEtapaVenda() {
        System.out.println("UpdateSegundaEtapaVenda");
        Venda venda = null;
        VendaDAO instance = new VendaDAO();
        Resposta expResult = null;
        Resposta result = instance.UpdateSegundaEtapaVenda(venda);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Testa se ao inserir a venda ele retorna o ultimo id da venda
     */
    @Test
    public void testInserirVenda() {
        System.out.println("inserirVenda");
        Venda venda = new Venda();
        venda.setIdCliente(2);
        venda.setIdUsuario(2);
        VendaDAO instance = new VendaDAO();
       
        int resultado = instance.inserirVenda(venda);
        assertTrue(resultado > 0 );
      
    }

    /**
     * Testando se o metodo de select de vendas está retornando nulo ou não
     */
    @Test
    public void testGetVendas() {
        System.out.println("getVendas");
        VendaDAO instance = new VendaDAO();
       
        ArrayList<Venda> resultado = instance.getVendas();
        assertTrue(resultado != null);
        
    }

    /**
     * Testa se a venda foi excluida com sucesso
     */
    @Test
    public void testRemover() {
        System.out.println("remover");
        int id = 123;
        VendaDAO instance = new VendaDAO();
       
        Resposta resultado = instance.remover(id);
        assertEquals(200, resultado.getCodigo_erro());
   
    }


}

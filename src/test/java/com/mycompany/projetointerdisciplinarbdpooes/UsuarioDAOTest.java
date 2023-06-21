/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

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
public class UsuarioDAOTest {
    
    public UsuarioDAOTest() {
    }
    
    @BeforeAll
    public static void setUpClass() {
    }
    
    @AfterAll
    public static void tearDownClass() {
    }
    
    @BeforeEach
    public void setUp() {
    }
    
    @AfterEach
    public void tearDown() {
    }

    /**
     * Testando a autenticação do usuário
     */
    @Test
    public void testAutenticaUsuario() throws Exception {
        System.out.println("AutenticaUsuario");
        Usuario u = new Usuario("guilhermescholl99@gmail.com");
        u.setSenha("123testando");
        UsuarioDAO instance = new UsuarioDAO();
        
        Resposta resultado = instance.AutenticaUsuario(u);
        assertEquals(200, resultado.getCodigo_erro());
       
    }

    /**
     * Test of InsertNovoUsuario method, of class UsuarioDAO.
     */
    @Test
    public void testInsertNovoUsuario() throws Exception {
        System.out.println("InsertNovoUsuario");
        Usuario c = null;
        UsuarioDAO instance = new UsuarioDAO();
        Resposta expResult = null;
        Resposta result = instance.InsertNovoUsuario(c);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Verificando se o usuario existe no banco de dados
     */
    @Test
    public void testVerificaSeEmailUsuarioExiste() throws Exception {
        System.out.println("verificaSeEmailUsuarioExiste");
        String email = "guilhermescholl99@gmail.com";
        UsuarioDAO instance = new UsuarioDAO();
        boolean expResult = false;
        boolean resultado = instance.verificaSeEmailUsuarioExiste(email);
        assertTrue(resultado);
    
    }

    /**
     * verifica se o cpf existe no banco de dados
     */
    @Test
    public void testVerificaSeCPFUsuarioExiste() throws Exception {
        System.out.println("verificaSeCPFUsuarioExiste");
        String cpf = "123.123.123-12";
        UsuarioDAO instance = new UsuarioDAO();
        boolean expResult = false;
        boolean resultado = instance.verificaSeCPFUsuarioExiste(cpf);
        assertTrue(resultado);
    }

 
    
}

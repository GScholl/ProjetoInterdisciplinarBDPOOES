/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.projetointerdisciplinarbdpooes;

/**
 *
 * @author PC-02
 */
public class Resposta {

    private boolean erro;
    private int codigo_erro;
    private String mensagem_erro;
    private int usuario;

    public int getUsuario() {
        return usuario;
    }

    public void setUsuario(int usuario) {
        this.usuario = usuario;
    }

    public Resposta(boolean erro, int codigo_erro, String mensagem_erro) {
        this.erro = erro;
        this.codigo_erro = codigo_erro;
        this.mensagem_erro = mensagem_erro;
    }

    public boolean isErro() {
        return erro;
    }

    public void setErro(boolean erro) {
        this.erro = erro;
    }

    public int getCodigo_erro() {
        return codigo_erro;
    }

    public void setCodigo_erro(int codigo_erro) {
        this.codigo_erro = codigo_erro;
    }

    public String getMensagem_erro() {
        return mensagem_erro;
    }

    public void setMensagem_erro(String mensagem_erro) {
        this.mensagem_erro = mensagem_erro;
    }

}

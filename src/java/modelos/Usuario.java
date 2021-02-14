/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import utils.Conexao;


/**
 *
 * @author A
 */

public class Usuario {

    
    private String nome;
    private String senha;
    
    
public static boolean existeUsuario(String nome) throws Exception {
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where nome = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome);
            
            ResultSet rs = stm.executeQuery();
            return rs.next();
            
            

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;

       
    }
    
    
    
    
    public static boolean logar(String nome, String senha) throws Exception{
        Connection con = Conexao.conectar();
        String sql = "select * from usuario where nome = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, nome);
            stm.setString(2, senha);
            ResultSet rs = stm.executeQuery();
            return rs.next();

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

   

    public boolean salvar() {
        String sql = "insert into usuario(nome, senha)";
        sql += "values(?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(1, this.nome);
            stm.setString(2, this.senha);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update usuario set nome = ? where senha = ? ";
        
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
           
            stm.setString(1, this.nome);
            stm.setString(2, this.senha);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    


    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from usuario ";
        sql += " where nome = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

   

}
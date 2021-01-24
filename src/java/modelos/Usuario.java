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
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;


/**
 *
 * @author A
 */

public class Usuario {

    private String nome;
    private String cpf;
    private String usuario;
    private String senha;
    
    

    public static boolean podeLogar(String pUser, String pSenha) throws Exception{
        Connection con = Conexao.conectar();
        String sql = "select * from login where usuario = ? and senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            stm.setString(2, pSenha);
            ResultSet rs = stm.executeQuery();
            return rs.next();

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    public boolean userExiste(String pUser) {
        Connection con = Conexao.conectar();
        String sql = "select * from login where usuario = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pUser);
            ResultSet rs = stm.executeQuery();
            return rs.next();

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return true;
    }

    public boolean salvar() {
        String sql = "insert into usuario(nome, cpf, usuario, senha)";
        sql += "values(?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(5, this.usuario);
            stm.setString(6, this.senha);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update usuario set ";
        sql += "nome = ?,";
        sql += "cpf = ?,";
        sql += "usuario = ?";
        sql += " where senha = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.usuario);
            stm.setString(4, this.senha);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Usuario consultar(String pCpf) {
        Connection con = Conexao.conectar();
        String sql = "select * cpf, nome, usuario, senha"
                + " from usuario where cpf = ?";
        Usuario usuario = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCpf);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
               usuario = new Usuario();
               usuario.setCpf(pCpf);
               usuario.setNome(rs.getString("nome"));
               usuario.setUsuario(rs.getString("usuario"));
               usuario.setSenha(rs.getString("senha"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return usuario;
    }

    public List<Usuario> consultar() {
        Connection con = Conexao.conectar();
        String sql = "select * nome, cpf, usuario, senha from usuario";
        Usuario usuario = null;
        List<Usuario> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                usuario = new Usuario();
                usuario.setNome(rs.getString("nome"));
                usuario.setCpf(rs.getString("cpf"));
                usuario.setUsuario(rs.getString("usuario"));
                usuario.setSenha(rs.getString("senha"));
                lista.add(usuario);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from usuario ";
        sql += " where cpf = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.cpf);
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

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
}
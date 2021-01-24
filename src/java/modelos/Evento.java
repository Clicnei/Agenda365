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


public class Evento {
    


    private Integer id;
    private String titulo;
    private String criticidade;
    private String datainicio;
    private String datafim;
    

    public boolean salvar() {
        String sql = "insert into evento(titulo,criticidade,datainicio,datafim) values(?, ?, ?, ?,)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.titulo);
            stm.setString(2, this.criticidade);
            stm.setString(3, this.datainicio);
            stm.setString(4, this.datafim);
            
            return stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update into evento (id,titulo,criticidade,datainicio,datafim)";
        sql += "values(?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setString(2, this.titulo);
            stm.setString(3, this.criticidade);
            stm.setString(4, this.datainicio);
            stm.setString(5, this.datafim);
           
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from evento";
        sql += "where id =?";
       
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }
     public Evento consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "select * id,titulo,criticidade,datainicio,datafim from evento ";
        Evento evento = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                evento = new Evento();
            evento.setId(rs.getInt("id"));
            evento.setTitulo(rs.getString("titulo"));
            evento.setCriticidade(rs.getString("criticidade"));
            evento.setDatainicio(rs.getString("dataInicio"));
            evento.setDatafim(rs.getString("dataFim"));
                              
            }
            
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return evento;
    }
      public Evento consultar(String pTitulo) {
        Connection con = Conexao.conectar();
        String sql = "select  * id,titulo,criticidade,datainicio,datafim from equipamento ";
        Evento evento = null;        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,pTitulo);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                evento = new Evento();
            evento.setId(rs.getInt("id"));
            evento.setTitulo(rs.getString("titulo"));
            evento.setCriticidade(rs.getString("criticidade"));
            evento.setDatainicio(rs.getString("dataInicio"));
            evento.setDatafim(rs.getString("dataFim"));
                             
            }
            
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return evento;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Evento{id=").append(id);
        sb.append(", titulo=").append(titulo);
        sb.append(", criticidade=").append(criticidade);
        sb.append(", datainicio=").append(datainicio);
        sb.append(", datafim=").append(datafim);
       
        sb.append('}');
        return sb.toString();
    }
    
     public List<Evento> consultar() {
        List<Evento> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select * id, titulo, criticidade, datainicio, datafim" + "from equipamento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Evento evento = new Evento();
                evento.setTitulo(rs.getString("titulo"));
                evento.setCriticidade(rs.getString("criticidade"));
                evento.setDatainicio(rs.getString("datainicio"));
                evento.setDatafim(rs.getString("datafim"));
               

                lista.add(evento);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCriticidade() {
        return criticidade;
    }

    public void setCriticidade(String criticidade) {
        this.criticidade = criticidade;
    }

    public String getDatainicio() {
        return datainicio;
    }

    public void setDatainicio(String datainicio) {
        this.datainicio = datainicio;
    }

    public String getDatafim() {
        return datafim;
    }

    public void setDatafim(String datafim) {
        this.datafim = datafim;
    }
}
      

    
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import utils.Conexao;

/**
 *
 * @author Rubia
 */
public class equipamentos {

    private int id;
    private String modelo;
    private String marca;
    private String potenciaBtus;
    private String litragem;
   

    public boolean salvar() {
        String sql = "insert into equipamentos (modelo,marca,potenciaBtus,litragem)";
        sql += "values(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);           
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        String sql = "insert into equipamentos (modelo,marca,potenciaBtus,litragem)";
        sql += "values(?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);          
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public equipamentos consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "insert into equipamentos (modelo,marca,potenciaBtus,litragem)";
        sql += "values(?,?,?,?)";
        equipamentos equipamentos = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);         
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return equipamentos;
    }

    public boolean excluir(Integer id) {
        Connection con = Conexao.conectar();
        String sql = "delete from equipamentos";
        sql += "where id =?";
        boolean isDeletou = false;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            isDeletou = stm.execute();                       
        } catch (SQLException ex){
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return isDeletou;
        
           
                
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("equipamentos{id=").append(id);
        sb.append(", modelo=").append(modelo);
        sb.append(", marca=").append(marca);
        sb.append(", potenciaBtus=").append(potenciaBtus);
        sb.append(", litragem=").append(litragem);      
        sb.append('}');
        return sb.toString();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getPotenciaBtus() {
        return potenciaBtus;
    }

    public void setPotenciaBtus(String potenciaBtus) {
        this.potenciaBtus = potenciaBtus;
    }

    public String getLitragem() {
        return litragem;
    }

    public void setLitragem(String litragem) {
        this.litragem = litragem;
    }    

}

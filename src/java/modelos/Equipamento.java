package modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

/**
 * @author Volnei
 */
public class Equipamento {

    private int id;
    private String modelo;
    private String marca;
    private String potenciaBtus;
    private String litragem;
   
    public boolean salvar() {
        String sql = "insert into equipamento (id,modelo,marca,potenciaBtus,litragem)";
        sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
             stm.setInt(1, this.id);
            stm.setString(2, this.modelo);
            stm.setString(3, this.marca);
            stm.setString(4, this.potenciaBtus);
            stm.setString(5, this.litragem);           
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        String sql = "insert into equipamento (id,modelo,marca,potenciaBtus,litragem)";
        sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
             stm.setInt(1, this.id);
            stm.setString(2, this.modelo);
            stm.setString(3, this.marca);
            stm.setString(4, this.potenciaBtus);
            stm.setString(5, this.litragem);          
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Equipamento consultar() {
        Connection con = Conexao.conectar();
        String sql = "select id,modelo,marca,potenciaBtus,litragem from equipamento ";
        Equipamento equipamento = null;
        List<Equipamento> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setString(2, this.modelo);
            stm.setString(3, this.marca);
            stm.setString(4, this.potenciaBtus);
            stm.setString(5, this.litragem);         
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return equipamento;
    }

    public boolean excluir(Integer id) {
        Connection con = Conexao.conectar();
        String sql = "delete from equipamento";
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

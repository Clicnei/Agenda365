package modelos;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Equipamento {

    private Integer id;
    private String modelo;
    private String marca;
    private String potenciaBtus;
    private String litragem;
    private String tensao;

    public boolean salvar() {
        String sql = "insert into equipamento(modelo, marca, potenciabtus, "
                + "litragem, tensao) values(?, ?, ?, ?, ?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);
            stm.setString(5, this.tensao);
            return stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "insert into equipamento (modelo,marca,potenciaBtus,litragem,tensao)";
        sql += "values(?,?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            
            stm.setString(2, this.modelo);
            stm.setString(3, this.marca);
            stm.setString(4, this.potenciaBtus);
            stm.setString(5, this.litragem);
            stm.setString(5, this.tensao);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from equipamento";
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
     public Equipamento consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "select id,modelo,marca,potenciaBtus,litragem,tensao from equipamento ";
        Equipamento equipamento = null;
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                equipamento = new Equipamento();
            equipamento.setId(rs.getInt("id"));
            equipamento.setModelo(rs.getString("modelo"));
            equipamento.setMarca(rs.getString("marca"));
            equipamento.setPotenciaBtus(rs.getString("potenciaBtuus"));
            equipamento.setLitragem(rs.getString("litragem"));
            equipamento.setTensao(rs.getString("tensao"));                     
            }
            
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return equipamento;
    }
      public Equipamento consultar(String pModelo) {
        Connection con = Conexao.conectar();
        String sql = "select id,modelo,marca,potenciaBtus,litragem,tensao from equipamento ";
        Equipamento equipamento = null;        
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,pModelo);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                equipamento = new Equipamento();
            equipamento.setId(rs.getInt("id"));
            equipamento.setModelo(rs.getString("modelo"));
            equipamento.setMarca(rs.getString("marca"));
            equipamento.setPotenciaBtus(rs.getString("potenciaBtuus"));
            equipamento.setLitragem(rs.getString("litragem"));
            equipamento.setTensao(rs.getString("tensao"));                     
            }
            
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return equipamento;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Equipamento{id=").append(id);
        sb.append(", modelo=").append(modelo);
        sb.append(", marca=").append(marca);
        sb.append(", potenciaBtus=").append(potenciaBtus);
        sb.append(", litragem=").append(litragem);
        sb.append(", tensao=").append(tensao);
        sb.append('}');
        return sb.toString();
    }
    
     public List<Equipamento> consultar() {
        List<Equipamento> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, modelo, marca, potenciabtus, litragem, tensao" + "from equipamento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Equipamento equipamento = new Equipamento();
                equipamento.setMarca(rs.getString("modelo"));
                equipamento.setModelo(rs.getString("marca"));
                equipamento.setMarca(rs.getString("potencaibtus"));
                equipamento.setModelo(rs.getString("litragem"));
                equipamento.setMarca(rs.getString("tensao"));

                lista.add(equipamento);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
      

    public Equipamento() {
    }

   

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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

    public String getTensao() {
        return tensao;
    }

    public void setTensao(String tensao) {
        this.tensao = tensao;
    }

}

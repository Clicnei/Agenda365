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
    private String aparelho;

    public boolean salvar() {
        String sql = "insert into equipamento(modelo, marca, potenciaBtus, ";
        sql += "litragem, tensao,aparelho)";
        sql += "values(?,?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);
            stm.setString(5, this.tensao);
            stm.setString(6, this.aparelho);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    
        
    public boolean alterar(){
       Connection con = Conexao.conectar();
       String sql = "update equipamento set ";
              sql +="modelo = ?,";
              sql +="marca = ?,";
              sql +="potenciaBtus = ?,";
              sql +="litragem = ?,";
              sql +="tensao = ?,";
              sql +="aparelho = ? ";
              sql +=" where id = ?";try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.modelo);
            stm.setString(2, this.marca);
            stm.setString(3, this.potenciaBtus);
            stm.setString(4, this.litragem);
            stm.setString(5, this.tensao);
            stm.setString(6, this.aparelho);
            stm.setInt(7, this.id);
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
        sql += " where id =?";

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public Equipamento consultar(Integer id) {
        
        Connection con = Conexao.conectar();
        String sql = "select id, modelo, marca, potenciabtus, litragem, tensao, aparelho from equipamento where id =?";
        Equipamento equipamento = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                equipamento = new Equipamento();
                equipamento.setId(rs.getInt("id"));
                equipamento.setModelo(rs.getString("modelo"));
                equipamento.setMarca(rs.getString("marca"));
                equipamento.setPotenciaBtus(rs.getString("potenciabtus"));
                equipamento.setLitragem(rs.getString("litragem"));
                equipamento.setAparelho(rs.getString("aparelho"));
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
        sb.append(", aparelho=").append(aparelho);
        sb.append('}');
        return sb.toString();
    }

    public static List<Equipamento> consultar() {

        Connection con = Conexao.conectar();
        String sql = "select * from equipamento";
        List<Equipamento> lista = new ArrayList<>();

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Equipamento equipamento = new Equipamento();
                equipamento.setId(rs.getInt("id"));
                equipamento.setModelo(rs.getString("modelo"));
                equipamento.setMarca(rs.getString("marca"));
                equipamento.setPotenciaBtus(rs.getString("potenciaBtus"));
                equipamento.setLitragem(rs.getString("litragem"));
                equipamento.setTensao(rs.getString("tensao"));
                equipamento.setAparelho(rs.getString("aparelho"));

                lista.add(equipamento);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }

        System.out.println(lista);

        return lista;
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

    public String getAparelho() {
        return aparelho;
    }

    public void setAparelho(String aparelho) {
        this.aparelho = aparelho;
    }

}

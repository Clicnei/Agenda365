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
import java.sql.Date;
import java.util.List;
import utils.Conexao;

public class Agendamento {

    private Integer id;
    private String tipo;
    private int ordemServicoId;
    private Date dataInicio;
    private Date dataFim;
    private String criticidade;

    public boolean salvar() {
        String sql = "insert into agendamento(tipo,ordemServico,dataInicio,dataFim,criticidade) values(?, ?, ?, ?, ?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.tipo);
            stm.setInt(2, this.ordemServicoId);
            stm.setDate(3, this.dataInicio);
            stm.setDate(4, this.dataFim);
            stm.setString(5, this.criticidade);

            return stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update into agendamento (id,tipo,ordemServico,datainicio,datafim,criticidade)";
        sql += "values(?,?,?,?,?,?)";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.id);
            stm.setString(2, this.tipo);
            stm.setInt(3, this.ordemServicoId);
            stm.setDate(4, this.dataInicio);
            stm.setDate(5, this.dataFim);
            stm.setString(6, this.criticidade);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from agendamento";
        sql += "where id =?";

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

    public Agendamento consultar(int id) {
        Connection con = Conexao.conectar();
        String sql = "select id,tipo,ordemServico,dataInicio,dataFim,criticidade from agendamento where id = ?";
        Agendamento agendamento = null;

        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                agendamento = new Agendamento();
                agendamento.setId(rs.getInt("id"));
                agendamento.setTipo(rs.getString("tipo"));
                agendamento.setOrdemServicoId(rs.getInt("ordemServico"));
                agendamento.setDataInicio(rs.getDate("dataInicio"));
                agendamento.setDataFim(rs.getDate("dataFim"));
                agendamento.setCriticidade(rs.getString("criticidade"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return agendamento;
    }

    public List<Agendamento> consultarByOrdemServico(int idOrdemServico) {
        List<Agendamento> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select tipo,datainicio,datafim,criticidade from agendamento where ordemservicoid = ?";
        Agendamento agendamento = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, idOrdemServico);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                agendamento = new Agendamento();
                agendamento.setTipo(rs.getString("tipo"));
                agendamento.setDataInicio(rs.getDate("dataInicio"));
                agendamento.setDataFim(rs.getDate("dataFim"));
                agendamento.setCriticidade(rs.getString("criticidade"));

                lista.add(agendamento);
            }

        } catch (SQLException ex) {
            System.out.println("Erro:" + ex.getMessage());

        }
        return lista;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Agendamento{id=").append(id);
        sb.append(", tipo=").append(tipo);
        sb.append(", ordemServicoId=").append(ordemServicoId);
        sb.append(", dataInicio=").append(dataInicio);
        sb.append(", dataFim=").append(dataFim);
        sb.append(", criticidade=").append(criticidade);

        sb.append('}');
        return sb.toString();
    }

    public List<Agendamento> consultar() {
        List<Agendamento> lista = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql = "select id, tipo, ordemservicoid, dataInicio, dataFim, criticidade from agendamento";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Agendamento agendamento = new Agendamento();
                agendamento.setTipo(rs.getString("tipo"));
                agendamento.setOrdemServicoId(rs.getInt("ordemservicoid"));
                agendamento.setDataInicio(rs.getDate("dataInicio"));
                agendamento.setDataFim(rs.getDate("dataFim"));
                agendamento.setCriticidade(rs.getString("criticidade"));

                lista.add(agendamento);
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getOrdemServicoId() {
        return ordemServicoId;
    }

    public void setOrdemServicoId(int ordemServicoId) {
        this.ordemServicoId = ordemServicoId;
    }

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    }

    public String getCriticidade() {
        return criticidade;
    }

    public void setCriticidade(String criticidade) {
        this.criticidade = criticidade;
    }
}

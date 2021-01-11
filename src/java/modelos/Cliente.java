package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Cliente {

    private String id;
    private String nome;
    private String cpf;
    private String cnpj;
    private String email;
    private String fone;
    private String fonefixo;
    private String rua;
    private String numero;
    private String complemento;
    private String bairro;
    private String cep;
    private String cidade;
    private String estado;

    /*
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
     */
    public boolean salvar() {
        String sql = "insert into cliente(id, nome, cpf, cnpj, email, fone, "
                + "fonefixo, rua, numero, complemento, bairro, cep, cidade, estado )";
        sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.id);
            stm.setString(2, this.nome);
            stm.setString(3, this.cpf);
            stm.setString(4, this.cnpj);
            stm.setString(5, this.email);
            stm.setString(6, this.fone);
            stm.setString(7, this.fonefixo);
            stm.setString(8, this.rua);
            stm.setString(9, this.numero);
            stm.setString(10, this.complemento);
            stm.setString(11, this.bairro);
            stm.setString(12, this.cep);
            stm.setString(13, this.cidade);
            stm.setString(14, this.estado);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public boolean alterar() {
        Connection con = Conexao.conectar();
        String sql = "update cliente set ";
        sql += "nome = ?,";
        sql += "cpf = ?,";
        sql += "cnpj = ?";
        sql += "email = ?";
        sql += "fone = ?";
        sql += "fonefixo = ?";
        sql += "rua = ?";
        sql += "numero = ?";
        sql += "complemento = ?";
        sql += "bairro = ?";
        sql += "cep = ?";
        sql += "cidade = ?";
        sql += "estado = ?";
        sql += " where cpf = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.cnpj);
            stm.setString(4, this.email);
            stm.setString(5, this.fone);
            stm.setString(6, this.fonefixo);
            stm.setString(7, this.rua);
            stm.setString(8, this.numero);
            stm.setString(9, this.complemento);
            stm.setString(10, this.bairro);
            stm.setString(11, this.cep);
            stm.setString(12, this.cidade);
            stm.setString(13, this.estado);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }

    public Cliente consultar(String pCpf) {
        Connection con = Conexao.conectar();
        String sql = "select nome, cpf, cnpj, email, fone, fonefixo, rua, numero"
                + "complemento, bairro, cep, cidade, estado"
                + " from cliente where cpf = ?";
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCpf);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setCpf(pCpf);
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setCnpj(rs.getString("cnpj"));
                cliente.setFone(rs.getString("fone"));
                cliente.setFonefixo(rs.getString("fonefixo"));
                cliente.setRua(rs.getString("rua"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
    }

    public List<Cliente> consultar() {
        Connection con = Conexao.conectar();
        String sql = "select id, nome, cpf, cnpj, email, fone, fonefixo, rua, numero,"
                + "complemento, bairro, cep, cidade, estado, from cliente";
        Cliente cliente = null;
        List<Cliente> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setId(rs.getString("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setCnpj(rs.getString("cnpj"));
                cliente.setFone(rs.getString("fone"));
                cliente.setFonefixo(rs.getString("fonefixo"));
                cliente.setRua(rs.getString("rua"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));

                lista.add(cliente);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }

    public boolean excluir() {
        Connection con = Conexao.conectar();
        String sql = "delete from cliente ";
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getFonefixo() {
        return fonefixo;
    }

    public void setFonefixo(String fonefixo) {
        this.fonefixo = fonefixo;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

}

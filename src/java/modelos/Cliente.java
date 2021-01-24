package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.Conexao;

public class Cliente {
    // mo exemplo não coloca Id //
    // private Integer id;

    private String nome;
    private String cpf;
    private String cnpj;
    private String rua;
    private String numero;
    private String complemento;
    private String bairro;
    private String cep;
    private String cidade;
    private String estado;
    private String telefoneFixo;
    private String telefoneCelular;
    private String email;
    private boolean isPessoaFisica;

    //no exemplo não usa Id// tratamento excessão conectar
    public boolean salvar() throws SQLException {
        String sql = "insert into cliente(nome, cpf, cnpj, rua, numero, "
                + "complemento, bairro, cep, cidade, estado, telefonefixo, "
                + "telefonecelular, email, isPessoaFisica )";
        sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        //Connection con = Conexao.conectar();
        Connection con = Conexao.conectar();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setString(1, this.id);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.cnpj);
            stm.setString(4, this.rua);
            stm.setString(5, this.numero);
            stm.setString(6, this.complemento);
            stm.setString(7, this.bairro);
            stm.setString(8, this.cep);
            stm.setString(9, this.cidade);
            stm.setString(10, this.estado);
            stm.setString(11, this.telefoneFixo);
            stm.setString(12, this.telefoneCelular);
            stm.setString(13, this.email);
            stm.setBoolean(14, this.isPessoaFisica);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    //tratamento excessão conectar

    public boolean alterar() throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "update cliente set ";
        sql += "nome = ?,";
        sql += "cpf = ?,";
        sql += "cnpj = ?";
        sql += "rua = ?";
        sql += "numero = ?";
        sql += "complemento = ?";
        sql += "bairro = ?";
        sql += "cep = ?";
        sql += "cidade = ?";
        sql += "estado = ?";
        sql += "telefoneFixo = ?";
        sql += "telefoneCelular = ?";
        sql += "email = ?";
        sql += " where cpf = ?";
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.nome);
            stm.setString(2, this.cpf);
            stm.setString(3, this.cnpj);
            stm.setString(4, this.rua);
            stm.setString(5, this.numero);
            stm.setString(6, this.complemento);
            stm.setString(7, this.bairro);
            stm.setString(8, this.cep);
            stm.setString(9, this.cidade);
            stm.setString(13, this.estado);
            stm.setString(10, this.telefoneFixo);
            stm.setString(11, this.telefoneCelular);
            stm.setString(12, this.email);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    //realizado tratamento excessão por throws//

    public Cliente consultar(String pCpf) throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "select * nome, cpf, cnpj, rua, numero, complemento, "
                + "bairro, cep, cidade, estado,telefoneFixo, telefoneCelular, email"
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
                //cliente.setCpf(rs.getString("cpf"));
                cliente.setCnpj(rs.getString("cnpj"));
                cliente.setRua(rs.getString("rua"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));
                cliente.setTelefoneFixo(rs.getString("telefoneFixo"));
                cliente.setTelefoneCelular(rs.getString("telefoneCelular"));
                cliente.setEmail(rs.getString("email"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
    }
    //consultar por Id ???? // tratamenmto excessão conectar

    public List<Cliente> consultar() throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "select * nome, cpf, cnpj, rua, numero, complemento"
                + "bairro, cep, cidade, estado, email from cliente";
        Cliente cliente = null;
        List<Cliente> lista = new ArrayList<>();
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                cliente = new Cliente();
                //cliente.setId(rs.getString("id"));
                cliente.setNome(rs.getString("nome"));
                cliente.setCpf(rs.getString("cpf"));
                cliente.setCnpj(rs.getString("cnpj"));
                cliente.setRua(rs.getString("rua"));
                cliente.setNumero(rs.getString("numero"));
                cliente.setComplemento(rs.getString("complemento"));
                cliente.setBairro(rs.getString("bairro"));
                cliente.setCep(rs.getString("cep"));
                cliente.setCidade(rs.getString("cidade"));
                cliente.setEstado(rs.getString("estado"));
                cliente.setTelefoneFixo(rs.getString("telefoneFixo"));
                cliente.setTelefoneCelular(rs.getString("telefoneCelular"));
                cliente.setEmail(rs.getString("email"));

                lista.add(cliente);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
    //tratamento excessão

    public boolean excluir() throws SQLException {
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

    public String getTelefoneFixo() {
        return telefoneFixo;
    }

    public void setTelefoneFixo(String telefoneFixo) {
        this.telefoneFixo = telefoneFixo;
    }

    public String getTelefoneCelular() {
        return telefoneCelular;
    }

    public void setTelefoneCelular(String telefoneCelular) {
        this.telefoneCelular = telefoneCelular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isIsPessoaFisica() {
        return isPessoaFisica;
    }

    public void setIsPessoaFisica(boolean isPessoaFisica) {
        this.isPessoaFisica = isPessoaFisica;
    }
}
   

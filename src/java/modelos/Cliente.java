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
    private Integer id;
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
    private String telefone;
    private String email;
    private boolean isPessoaFisica;

    //no exemplo não usa Id// tratamento excessão conectar
    public boolean salvar() throws SQLException {
        String sql = "insert into cliente(nome, cpf, cnpj, rua, numero, "
                + "complemento, bairro, cep, cidade, estado, telefone, "
                + "email, isPessoaFisica )";
        sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
            stm.setString(11, this.telefone);           
            stm.setString(12, this.email);
            stm.setBoolean(13, this.isPessoaFisica);

            stm.execute();
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return false;
        }
        return true;
    }
    //tratamento excessão conectar

    public boolean alterar() throws SQLException, Exception {
        Connection con = Conexao.conectar();
        String sql = "update cliente set ";
        sql += "nome = ?,";
        sql += "cpf = ?,";
        sql += "cnpj = ?,";
        sql += "rua = ?,";
        sql += "numero = ?,";
        sql += "complemento = ?,";
        sql += "bairro = ?,";
        sql += "cep = ?,";
        sql += "cidade = ?,";
        sql += "estado = ?,";
        sql += "telefone = ?,";        
        sql += "email = ?";
        sql += " where id = ?";
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
            stm.setString(10, this.estado);
            stm.setString(11, this.telefone);           
            stm.setString(12, this.email);
            stm.setInt(13, this.id);

            stm.execute();
        } catch (SQLException ex) {
           // System.out.println("Erro: " + ex.getMessage());
            throw new Exception("erro " + ex.getMessage());
           // return false;
        }
        return true;
    }
    //realizado tratamento excessão por throws//

    
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
    
    //consultar por Id ???? // tratamenmto excessão conectar

    public List<Cliente> consultar() throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "select  * from cliente";        
        List<Cliente> lista = new ArrayList<>();
        
        
        try {
            PreparedStatement stm = con.prepareStatement(sql);           
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setId(rs.getInt("id"));
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
                cliente.setTelefone(rs.getString("telefone"));                
                cliente.setEmail(rs.getString("email"));

                lista.add(cliente);
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return lista;
    }
     public Cliente consultar(String pCpf) throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "select * from cliente where cpf = ?";
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCpf);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setCpf(pCpf);
                cliente.setId(rs.getInt("id"));
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
                cliente.setTelefone(rs.getString("telefone"));                
                cliente.setEmail(rs.getString("email"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
    }
     
     public Cliente consulta(String pCnpj) throws SQLException {
        Connection con = Conexao.conectar();
        String sql = "select * from cliente where cnpj = ?";
        Cliente cliente = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, pCnpj);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                cliente = new Cliente();
                cliente.setCnpj(pCnpj);
                cliente.setId(rs.getInt("id"));
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
                cliente.setTelefone(rs.getString("telefone"));                
                cliente.setEmail(rs.getString("email"));
            }

        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
        }
        return cliente;
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

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
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

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
}
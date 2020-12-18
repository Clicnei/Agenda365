package modelos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.Conexao;

/**
 * @author Volnei
 */
public class Login {
    
    private String nome;
    private String cpf;
    private String fone;
    private String usuario;
    private String senha;

    public static boolean podeLogar(String pUser, String pSenha) {
        Connection con = Conexao.conectar();
        String sql = "select * from cliente where usuario = ? and senha = ?";
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
}

package Classes;

import Conexao.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Usuario {
   
    private String  Usuario;
    private String  Senha;
    private String  Nome_User;
    private String  email_usuario;
    private String  niv_usuario;
    private String  sit_senha;
    private int     nr_sequencia;
   
    //INCLUIR USUARIO
    public boolean incluirUsuario () throws ClassNotFoundException{
        String sql  = "insert into usuario (Usuario,Senha,Nome_User,email_usuario,niv_usuario,sit_senha) ";
               sql += "values(?,?,?,?,?,?)"; 
        Connection con = Conexao.conectar();
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setString(1, this.Usuario);
           stm.setString(2, this.Senha);
           stm.setString(3, this.Nome_User);
           stm.setString(4, this.email_usuario);
           stm.setString(5, this.niv_usuario);
           stm.setString(6, this.sit_senha);
           stm.execute();
        }catch(SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage() + sql);
           return false;
        }
        return true;
    }
    
    //ALTERAR USUARIO
    public boolean alterarUsuario () throws SQLException, ClassNotFoundException{
        String sql  = "update usuario ";
               sql += "set Usuario      = ?, ";
               sql += "    Senha        = ?,  ";
               sql += "    Nome_User    = ?, ";
               sql += "    email_usuario   = ?, ";
               sql += "    niv_usuario  = ?,  ";
               sql += "    sit_senha    = ?  ";
               sql += "where nr_sequencia    = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1, this.Usuario);
            stm.setString(2, this.Senha);
            stm.setString(3, this.Nome_User);
            stm.setString(4, this.email_usuario); 
            stm.setString(5, this.niv_usuario); 
            stm.setString(6, this.sit_senha); 
            stm.setInt(7,    this.nr_sequencia); 
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR USUARIO
    public boolean excluirUsuario () throws SQLException, ClassNotFoundException{
        String sql  = "delete from usuario ";
               sql += "where nr_sequencia = ? ";  
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,    this.nr_sequencia); 
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //CONSULTAR USUARIO
    public Usuario consultarUsuario (int nr_sequencia) throws SQLException, ClassNotFoundException{
        Connection con = Conexao.conectar();
        String sql  = "select nr_sequencia, Usuario, Senha, Nome_User, email_usuario, niv_usuario, sit_senha ";
               sql += "from Usuario ";
               sql += "where nr_sequencia = ? "; 
        Usuario usu = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1,    nr_sequencia); 
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                usu = new Usuario();
                usu.setNr_sequencia(nr_sequencia);
                usu.setUsuario    (rs.getString ("Usuario"));
                usu.setSenha      (rs.getString ("Senha"));
                usu.setNome_User  (rs.getString ("Nome_User"));
                usu.setEmail_usuario(rs.getString ("email_usuario"));
                usu.setNiv_usuario(rs.getString ("niv_usuario"));
                usu.setSit_senha  (rs.getString ("sit_senha"));
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return usu;
    }   
    
    //CONSULTAR TODAS AS ANAMNESES
    public List<Usuario> consultarTodosUsuario() throws SQLException, ClassNotFoundException{
        List<Usuario> listaUsu = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "select nr_sequencia, Usuario, Senha, Nome_User, email_usuario, niv_usuario, sit_senha ";
               sql += "from usuario ";
               sql += "order by usuario";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Usuario usu = new Usuario();
               usu.setNr_sequencia(rs.getInt("nr_sequencia"));
               usu.setUsuario    (rs.getString ("Usuario"));
               usu.setSenha      (rs.getString ("Senha"));
               usu.setNome_User  (rs.getString ("Nome_User"));
               usu.setEmail_usuario (rs.getString ("email_usuario"));
               usu.setNiv_usuario(rs.getString ("niv_usuario"));
               usu.setSit_senha  (rs.getString ("sit_senha"));
               listaUsu.add(usu);
           }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listaUsu;
    }    

        public Usuario autenticarUsuario(String pUsuario, String pSenha) {
            Usuario usu = null;
            Connection con = null;
        try {
            con = Conexao.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Usuario.class.getName()).log(Level.SEVERE, null, ex);
        }
            String sql = "select distinct niv_usuario ";
                   sql+= "from usuario ";
                   sql+= "where usuario = ? ";
                   sql+= "  and senha   = ? ";
            try {
                PreparedStatement stm = con.prepareStatement(sql);
                stm.setString(1, pUsuario);
                stm.setString(2, pSenha);
                ResultSet rs = stm.executeQuery();
                if(rs.next()){
                    usu = new Usuario();
                    usu.setNiv_usuario(rs.getString ("niv_usuario"));
                }
            } 
                catch (SQLException ex) {
                System.out.println("Erro: " + ex.getMessage());
            }
            return usu;
    }

    public String getUsuario() {
        return Usuario;
    }

    
    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    
    public String getSenha() {
        return Senha;
    }

    
    public void setSenha(String Senha) {
        this.Senha = Senha;
    }

    
    public String getNome_User() {
        return Nome_User;
    }

    
    public void setNome_User(String Nome_User) {
        this.Nome_User = Nome_User;
    }

    
    public String getEmail_usuario() {
        return email_usuario;
    }

    
    public void setEmail_usuario(String email_usuario) {
        this.email_usuario = email_usuario;
    }

    
    public String getNiv_usuario() {
        return niv_usuario;
    }

    
    public void setNiv_usuario(String niv_usuario) {
        this.niv_usuario = niv_usuario;
    }

    
    public String getSit_senha() {
        return sit_senha;
    }

    
    public void setSit_senha(String sit_senha) {
        this.sit_senha = sit_senha;
    }
    
     public int getNr_sequencia() {
        return nr_sequencia;
    }

    public void setNr_sequencia(int nr_sequencia) {
        this.nr_sequencia = nr_sequencia;
    }
}

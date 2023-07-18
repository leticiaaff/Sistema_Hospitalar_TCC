package Classes;

import Conexao.Conexao;

import java.sql.Date;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Paciente {
   private int      Cod_Paci;
   private String   Nome_Paci;
   private String   Cpf_Paci;
   private String   RG_Paci;
   private String   Sexo_Paci;
   private Date     Data_Nasc_Paci;
   private String   Fone_Paci;
   private String   Fone_Resp;
   private String   Email_Paci;
   private String   Estado_Paci;
   private String   Cidade_Paci;
   private String   Bairro_Paci;
   private String      Cep_Paci;
   private String   Endereco_Paci;  
   
   //INCLUIR PACIENTE
   public boolean incluirPaciente () throws ClassNotFoundException{
       String sql  = "insert into paciente (Nome_Paci,Cpf_Paci,RG_Paci, ";
              sql += "Sexo_Paci,Data_Nasc_Paci,Fone_Paci,Fone_Resp, ";
              sql += "Email_Paci,Estado_Paci,Cidade_Paci,Bairro_Paci, ";
              sql += "Cep_Paci,Endereco_Paci) ";
              sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
       Connection con = Conexao.conectar();
       try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString (1,        this.Nome_Paci);
            stm.setString (2,        this.Cpf_Paci);
            stm.setString (3,        this.RG_Paci);
            stm.setString (4,        this.Sexo_Paci);
            stm.setDate   (5, (Date) this.Data_Nasc_Paci);
            stm.setString (6,        this.Fone_Paci);
            stm.setString (7,        this.Fone_Resp);
            stm.setString (8,        this.Email_Paci);
            stm.setString (9,        this.Estado_Paci);
            stm.setString (10,       this.Cidade_Paci);
            stm.setString (11,       this.Bairro_Paci);
            stm.setString    (12,    this.Cep_Paci);
            stm.setString (13,       this.Endereco_Paci);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
   }
   
   //ALTERAR PACIENTE
    public boolean alterarPaciente() throws ClassNotFoundException{
        String sql =  "update paciente ";
               sql += "set Nome_Paci      = ?, ";
               sql += "    Cpf_Paci       = ?, ";
               sql += "    RG_Paci        = ?, ";
               sql += "    Sexo_Paci      = ?, ";
               sql += "    Data_Nasc_Paci = ?, ";
               sql += "    Fone_Paci      = ?, ";
               sql += "    Fone_Resp      = ?, ";
               sql += "    Email_Paci     = ?, ";
               sql += "    Estado_Paci    = ?, ";
               sql += "    Cidade_Paci    = ?, ";
               sql += "    Bairro_Paci    = ?, ";
               sql += "    Cep_Paci       = ?, ";
               sql += "    Endereco_Paci  = ? ";
               sql += "where Cod_Paci     = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString  (1,        this.Nome_Paci);
            stm.setString  (2,        this.Cpf_Paci);
            stm.setString  (3,        this.RG_Paci);
            stm.setString  (4,        this.Sexo_Paci);
            stm.setDate    (5, (Date) this.Data_Nasc_Paci);
            stm.setString  (6,        this.Fone_Paci);
            stm.setString  (7,        this.Fone_Resp);
            stm.setString  (8,        this.Email_Paci);
            stm.setString  (9,        this.Estado_Paci);
            stm.setString  (10,       this.Cidade_Paci);
            stm.setString  (11,       this.Bairro_Paci);
            stm.setString  (12,       this.Cep_Paci);
            stm.setString  (13,       this.Endereco_Paci);
            stm.setInt     (14,       this.Cod_Paci);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR PACIENTE
    public boolean excluirPaciente() throws ClassNotFoundException{
        String sql =  "delete from paciente ";
               sql += "where Cod_Paci = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.Cod_Paci);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //CONSULTAR PACIENTE
    public Paciente consultarPaciente(int pCod_Paci) throws SQLException, ClassNotFoundException{
        Connection con = Conexao.conectar();
        String sql =  "select Cod_Paci, Nome_Paci, Cpf_Paci, RG_Paci, ";
               sql += "Sexo_Paci, Data_Nasc_Paci, Fone_Paci, Fone_Resp, ";
               sql += "Email_Paci, Estado_Paci, Cidade_Paci, Bairro_Paci, ";
               sql += "Cep_Paci, Endereco_Paci ";
               sql += "from paciente ";
               sql += "where Cod_Paci = ? ";
        Paciente paci = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_Paci);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                paci = new Paciente();
                paci.setCod_Paci      (pCod_Paci);
                paci.setNome_Paci     (rs.getString ("Nome_Paci"));
                paci.setCpf_Paci      (rs.getString ("Cpf_Paci"));
                paci.setRG_Paci       (rs.getString ("RG_Paci"));
                paci.setSexo_Paci     (rs.getString ("Sexo_Paci"));
                paci.setData_Nasc_Paci(rs.getDate   ("Data_Nasc_Paci"));
                paci.setFone_Paci     (rs.getString ("Fone_Paci"));
                paci.setFone_Resp     (rs.getString ("Fone_Resp"));
                paci.setEmail_Paci    (rs.getString ("Email_Paci"));
                paci.setEstado_Paci   (rs.getString ("Estado_Paci"));
                paci.setCidade_Paci   (rs.getString ("Cidade_Paci"));
                paci.setBairro_Paci   (rs.getString ("Bairro_Paci"));
                paci.setCep_Paci      (rs.getString    ("Cep_Paci"));
                paci.setEndereco_Paci (rs.getString ("Endereco_Paci"));
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return paci;
    }
    
    //CONSULTAR TODOS OS PACIENTES
    public List<Paciente> consultarTodosPacientes () throws SQLException, ClassNotFoundException{
        List<Paciente> listapaci = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql =  "select Cod_Paci, Nome_Paci, Cpf_Paci, RG_Paci, ";
               sql += "Sexo_Paci, Data_Nasc_Paci, Fone_Paci, Fone_Resp, ";
               sql += "Email_Paci, Estado_Paci, Cidade_Paci, Bairro_Paci, ";
               sql += "Cep_Paci, Endereco_Paci ";
               sql += "from paciente ";
               sql += "order by Nome_Paci";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Paciente paci = new Paciente();
               paci.setCod_Paci      (rs.getInt    ("Cod_Paci"));
               paci.setNome_Paci     (rs.getString ("Nome_Paci"));
               paci.setCpf_Paci      (rs.getString ("Cpf_Paci"));
               paci.setRG_Paci       (rs.getString ("RG_Paci"));
               paci.setSexo_Paci     (rs.getString ("Sexo_Paci"));
               paci.setData_Nasc_Paci(rs.getDate   ("Data_Nasc_Paci"));
               paci.setFone_Paci     (rs.getString ("Fone_Paci"));
               paci.setFone_Resp     (rs.getString ("Fone_Resp"));
               paci.setEmail_Paci    (rs.getString ("Email_Paci"));
               paci.setEstado_Paci   (rs.getString ("Estado_Paci"));
               paci.setCidade_Paci   (rs.getString ("Cidade_Paci"));
               paci.setBairro_Paci   (rs.getString ("Bairro_Paci"));
               paci.setCep_Paci      (rs.getString    ("Cep_Paci"));
               paci.setEndereco_Paci (rs.getString ("Endereco_Paci"));
               listapaci.add(paci); 
           }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listapaci;
    }

    // CONSULTAR TODOS OS PACIENTES PARA MONTAR UM "SELECT" NO HTML
    // LOV = LIST OF VALUES = LISTA DE VALORES
    public List<Paciente> lovPacientes () throws SQLException, ClassNotFoundException{
        List<Paciente> listapaci = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql =  "select Cod_Paci, Nome_Paci ";
               sql += "from paciente ";
               sql += "order by Nome_Paci";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Paciente paci = new Paciente();
               paci.setCod_Paci      (rs.getInt    ("Cod_Paci"));
               paci.setNome_Paci     (rs.getString ("Nome_Paci"));
               listapaci.add(paci); 
           }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listapaci;
    }
   
    public int getCod_Paci() {
        return Cod_Paci;
    }

    
    public void setCod_Paci(int Cod_Paci) {
        this.Cod_Paci = Cod_Paci;
    }

    
    public String getNome_Paci() {
        return Nome_Paci;
    }

    
    public void setNome_Paci(String Nome_Paci) {
        this.Nome_Paci = Nome_Paci;
    }

    
    public String getCpf_Paci() {
        return Cpf_Paci;
    }

    
    public void setCpf_Paci(String Cpf_Paci) {
        this.Cpf_Paci = Cpf_Paci;
    }

    
    public String getRG_Paci() {
        return RG_Paci;
    }

    
    public void setRG_Paci(String RG_Paci) {
        this.RG_Paci = RG_Paci;
    }

    
    public String getSexo_Paci() {
        return Sexo_Paci;
    }

    
    public void setSexo_Paci(String Sexo_Paci) {
        this.Sexo_Paci = Sexo_Paci;
    }

    
    public Date getData_Nasc_Paci() {
        return Data_Nasc_Paci;
    }

    
    public void setData_Nasc_Paci(Date Data_Nasc_Paci) {
        this.Data_Nasc_Paci = Data_Nasc_Paci;
    }

    
    public String getFone_Paci() {
        return Fone_Paci;
    }

    
    public void setFone_Paci(String Fone_Paci) {
        this.Fone_Paci = Fone_Paci;
    }

    
    public String getFone_Resp () {
        return Fone_Resp;
    }
    
    
    public void setFone_Resp (String Fone_Resp) {
        this.Fone_Resp = Fone_Resp;
    }
    
    
    public String getEmail_Paci() {
        return Email_Paci;
    }

    
    public void setEmail_Paci(String Email_Paci) {
        this.Email_Paci = Email_Paci;
    }

    
    public String getEstado_Paci() {
        return Estado_Paci;
    }

    
    public void setEstado_Paci(String Estado_Paci) {
        this.Estado_Paci = Estado_Paci;
    }

    
    public String getCidade_Paci() {
        return Cidade_Paci;
    }

    
    public void setCidade_Paci(String Cidade_Paci) {
        this.Cidade_Paci = Cidade_Paci;
    }

    
    public String getBairro_Paci() {
        return Bairro_Paci;
    }

    
    public void setBairro_Paci(String Bairro_Paci) {
        this.Bairro_Paci = Bairro_Paci;
    }

    
//    public int getCep_Paci() {
//        return Cep_Paci;
//    }
//
//    
//    public void setCep_Paci(int Cep_Paci) {
//        this.Cep_Paci = Cep_Paci;
//    }

    public String getCep_Paci() {
        return Cep_Paci;
    }

    public void setCep_Paci(String Cep_Paci) {
        this.Cep_Paci = Cep_Paci;
    }
    
    public String getEndereco_Paci() {
        return Endereco_Paci;
    }

    
    public void setEndereco_Paci(String Endereco_Paci) {
        this.Endereco_Paci = Endereco_Paci;
    }
    
}

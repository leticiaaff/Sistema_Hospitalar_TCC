package Classes;

import Conexao.Conexao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;


public class Medico {
    private int    Cod_Med;
    private String Nome_Med;
    private String Cpf_Med;
    private String RG_Med;
    private String Sexo_Med;
    private Date   Data_Nasc_Med;
    private String Fone_Med;
    private int    Cod_Espec_Med;
    private String Cod_Registro;
    private String Estado_Med;
    private String Cidade_Med;
    private String Bairro_Med;
    private String    Cep_Med;
    private String Endereco_Med; 

    //INCLUIR O MÉDICO
    public boolean incluirMedico () throws ClassNotFoundException{
    //PEGA OS ATRIBUTOS DO BANCO E INSERE OS VALORES
        String sql  = "insert into medico (Nome_Med,Cpf_Med,RG_Med,Sexo_Med, ";
               sql += "Data_Nasc_Med,Fone_Med,Cod_Espec_Med,Cod_Registro,Estado_Med, ";
               sql += "Cidade_Med,Bairro_Med,Cep_Med,Endereco_Med) ";
               sql += "values(?,?,?,?,?,?,?,?,?,?,?,?,?)";
    //FAZ A CONEXÃO COM O BANCO
        Connection con = Conexao.conectar();
    //FAZ O TRATAMENTO DE EXCEÇÕES
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString  (1,         this.Nome_Med);
            stm.setString  (2,         this.Cpf_Med);
            stm.setString  (3,         this.RG_Med);
            stm.setString  (4,         this.Sexo_Med);
            stm.setDate    (5,       (Date)  this.Data_Nasc_Med);
            stm.setString  (6,         this.Fone_Med);
            stm.setInt     (7,         this.Cod_Espec_Med);
            stm.setString  (8,         this.Cod_Registro);
            stm.setString  (9,         this.Estado_Med);
            stm.setString  (10,        this.Cidade_Med);
            stm.setString  (11,        this.Bairro_Med);
            stm.setString     (12,        this.Cep_Med);
            stm.setString  (13,        this.Endereco_Med);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //ALTERAR O MÉDICO
    public boolean alterarMedico() throws ClassNotFoundException{
        String sql =  "update medico ";
               sql += "set Nome_Med      = ?, ";
               sql += "    Cpf_Med       = ?, ";
               sql += "    RG_Med        = ?, ";
               sql += "    Sexo_Med      = ?, ";
               sql += "    Data_Nasc_Med = ?, ";
               sql += "    Fone_Med      = ?, ";
               sql += "    Cod_Espec_Med = ?, ";
               sql += "    Cod_Registro  = ?, ";
               sql += "    Estado_Med    = ?, ";
               sql += "    Cidade_Med    = ?, ";
               sql += "    Bairro_Med    = ?, ";
               sql += "    Cep_Med       = ?, ";
               sql += "    Endereco_Med  = ? ";
               sql += "where Cod_Med     = ? "; 
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString  (1,         this.Nome_Med);
            stm.setString  (2,         this.Cpf_Med);
            stm.setString  (3,         this.RG_Med);
            stm.setString  (4,         this.Sexo_Med);
            stm.setDate    (5,   (Date) this.Data_Nasc_Med);
            stm.setString  (6,         this.Fone_Med);
            stm.setInt     (7,         this.Cod_Espec_Med);
            stm.setString  (8,         this.Cod_Registro);
            stm.setString  (9,         this.Estado_Med);
            stm.setString  (10,        this.Cidade_Med);
            stm.setString  (11,        this.Bairro_Med);
            stm.setString     (12,        this.Cep_Med);
            stm.setString  (13,        this.Endereco_Med);
            stm.setInt     (14,        this.Cod_Med);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR MÉDICO
    public boolean excluirMedico() throws ClassNotFoundException{
        String sql =  "delete from medico ";
               sql += "where Cod_Med = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.Cod_Med);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //CONSULTAR MÉDICO
    public Medico consultarMedico(int pCod_Med) throws SQLException, ClassNotFoundException{
        Connection con = Conexao.conectar();
        String sql  = "select Cod_Med, Nome_Med, Cpf_Med, RG_Med, Sexo_Med, ";
               sql += "Data_Nasc_Med, Fone_Med, Cod_Espec_Med, Cod_Registro, Estado_Med, ";
               sql += "Cidade_Med, Bairro_Med, Cep_Med, Endereco_Med ";
               sql += "from medico ";
               sql += "where Cod_Med = ? ";
               sql += "order by Cod_Med ";
        Medico med = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_Med);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                med = new Medico();
                med.setCod_Med      (pCod_Med);
                med.setNome_Med     (rs.getString ("Nome_Med"));
                med.setCpf_Med      (rs.getString ("Cpf_Med"));
                med.setRG_Med       (rs.getString ("RG_Med"));
                med.setSexo_Med     (rs.getString ("Sexo_Med"));
                med.setData_Nasc_Med(rs.getDate   ("Data_Nasc_Med"));
                med.setFone_Med     (rs.getString ("Fone_Med"));
                med.setCod_Espec_Med(rs.getInt    ("Cod_Espec_Med"));
                med.setCod_Registro (rs.getString ("Cod_Registro"));
                med.setEstado_Med   (rs.getString ("Estado_Med"));
                med.setCidade_Med   (rs.getString ("Cidade_Med"));
                med.setBairro_Med   (rs.getString ("Bairro_Med"));
                med.setCep_Med      (rs.getString    ("Cep_Med"));
                med.setEndereco_Med (rs.getString ("Endereco_Med"));
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return med;
    }
    
    //CONSULTAR TODOS OS MÉDICOS
    public List<Medico> consultarTodosMedicos () throws SQLException, ClassNotFoundException{
        List<Medico> listamed = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "select Cod_Med, Nome_Med, Cpf_Med, RG_Med, Sexo_Med, ";
               sql += "Data_Nasc_Med, Fone_Med, Cod_Espec_Med, Cod_Registro, Estado_Med, ";
               sql += "Cidade_Med, Bairro_Med, Cep_Med, Endereco_Med ";
               sql += "from medico ";
               sql += "order by Cod_Med ";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Medico med = new Medico();
               med.setCod_Med      (rs.getInt     ("Cod_Med"));
               med.setNome_Med     (rs.getString  ("Nome_Med"));
               med.setCpf_Med      (rs.getString  ("Cpf_Med"));
               med.setRG_Med       (rs.getString  ("RG_Med"));
               med.setSexo_Med     (rs.getString  ("Sexo_Med"));
               med.setData_Nasc_Med(rs.getDate    ("Data_Nasc_Med"));
               med.setFone_Med     (rs.getString  ("Fone_Med"));
               med.setCod_Espec_Med(rs.getInt     ("Cod_Espec_Med"));
               med.setCod_Registro (rs.getString  ("Cod_Registro"));
               med.setEstado_Med   (rs.getString  ("Estado_Med"));
               med.setCidade_Med   (rs.getString  ("Cidade_Med"));
               med.setBairro_Med   (rs.getString  ("Bairro_Med"));
               med.setCep_Med      (rs.getString     ("Cep_Med"));
               med.setEndereco_Med (rs.getString  ("Endereco_Med"));
               listamed.add(med);
           }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listamed;
    }
    
    // CONSULTAR TODOS OS MEDICOS PARA MONTAR UM "SELECT" NO HTML
    // LOV = LIST OF VALUES = LISTA DE VALORES
    public List<Medico> lovMedicos () throws SQLException, ClassNotFoundException{
        List<Medico> listamed = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "select Cod_Med, Nome_Med ";
               sql += "from medico ";
               sql += "order by Nome_Med ";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Medico med = new Medico();
               med.setCod_Med      (rs.getInt     ("Cod_Med"));
               med.setNome_Med     (rs.getString  ("Nome_Med"));
               listamed.add(med);
           }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listamed;
    }
    
    
    
    
    
    //***************************************************************
    // AREA DE GETTERS E SETTERS
    //***************************************************************
    public int getCod_Med() {
        return Cod_Med;
    }
    
    public void setCod_Med(int Cod_Med) {
        this.Cod_Med = Cod_Med;
    }

    public String getNome_Med() {
        return Nome_Med;
    }
    
    public void setNome_Med(String Nome_Med) {
        this.Nome_Med = Nome_Med;
    }
    
    public String getCpf_Med() {
        return Cpf_Med;
    }
    
    public void setCpf_Med(String Cpf_Med) {
        this.Cpf_Med = Cpf_Med;
    }

    public String getRG_Med() {
        return RG_Med;
    }
   
    public void setRG_Med(String RG_Med) {
        this.RG_Med = RG_Med;
    }
    
    public String getSexo_Med() {
        return Sexo_Med;
    }
    
    public void setSexo_Med(String Sexo_Med) {
        this.Sexo_Med = Sexo_Med;
    }
    
    public Date getData_Nasc_Med() {
        return Data_Nasc_Med;
    }
   
    public void setData_Nasc_Med(Date Data_Nasc_Med) {
        this.Data_Nasc_Med = Data_Nasc_Med;
    }
    
    public String getFone_Med() {
        return Fone_Med;
    }
    
    public void setFone_Med(String Fone_Med) {
        this.Fone_Med = Fone_Med;
    }
   
    public int getCod_Espec_Med() {
        return Cod_Espec_Med;
    }

   
    public void setCod_Espec_Med(int Cod_Espec_Med) {
        this.Cod_Espec_Med = Cod_Espec_Med;
    }

    
    public String getCod_Registro() {
        return Cod_Registro;
    }
    
    public void setCod_Registro(String Cod_Registro) {
        this.Cod_Registro = Cod_Registro;
    }
    
    public String getEstado_Med() {
        return Estado_Med;
    }
    
    public void setEstado_Med(String Estado_Med) {
        this.Estado_Med = Estado_Med;
    }
    
    public String getCidade_Med() {
        return Cidade_Med;
    }
    
    public void setCidade_Med(String Cidade_Med) {
        this.Cidade_Med = Cidade_Med;
    }

        public String getBairro_Med() {
        return Bairro_Med;
    }

        public void setBairro_Med(String Bairro_Med) {
        this.Bairro_Med = Bairro_Med;
    }

//        public int getCep_Med() {
//        return Cep_Med;
//    }
//
//        public void setCep_Med(int Cep_Med) {
//        this.Cep_Med = Cep_Med;
//    }

    public String getCep_Med() {
        return Cep_Med;
    }

    public void setCep_Med(String Cep_Med) {
        this.Cep_Med = Cep_Med;
    }

    public String getEndereco_Med() {
        return Endereco_Med;
    }

        public void setEndereco_Med(String Endereco_Med) {
        this.Endereco_Med = Endereco_Med;
    }
    
}


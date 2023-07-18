package Classes;

import Conexao.Conexao;

import java.sql.Date;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Funcionario {
   private int      Cod_Fun;
   private String   Nome_Fun;
   private String   Cpf_Fun;
   private String   RG_Fun;
   private String   Sexo_Fun;
   private Date     Data_Nasc_Fun;
   private String   Fone_Fun;
   private String   Estado_Fun;
   private String   Cidade_Fun;
   private String   Bairro_Fun;
   private int      Cep_Fun;
   private String   Endereco_Fun;  
   
   //INCLUIR FUNCIONARIO
   public boolean incluirFuncionario () throws ClassNotFoundException{
       String sql  = "insert into funcionario (Nome_Fun,Cpf_Fun,RG_Fun, ";
              sql += "Sexo_Fun,Data_Nasc_Fun,Fone_Fun,Estado_Fun, ";
              sql += "Cidade_Fun,Bairro_Fun,Cep_Fun,Endereco_Fun) ";
              sql += "values(?,?,?,?,?,?,?,?,?,?,?)";
       Connection con = Conexao.conectar();
       try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString (1,        this.Nome_Fun);
            stm.setString (2,        this.Cpf_Fun);
            stm.setString (3,        this.RG_Fun);
            stm.setString (4,        this.Sexo_Fun);
            stm.setDate   (5, (Date) this.Data_Nasc_Fun);
            stm.setString (6,        this.Fone_Fun);
            stm.setString (7,        this.Estado_Fun);
            stm.setString (8,        this.Cidade_Fun);
            stm.setString (9,       this.Bairro_Fun);
            stm.setInt    (10,       this.Cep_Fun);
            stm.setString (11,       this.Endereco_Fun);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
   }
   
   //ALTERAR FUNCIONARIO
    public boolean alterarFuncionario() throws ClassNotFoundException{
        String sql =  "update funcionario ";
               sql += "set Nome_Fun      = ?, ";
               sql += "    Cpf_Fun       = ?, ";
               sql += "    RG_Fun        = ?, ";
               sql += "    Sexo_Fun      = ?, ";
               sql += "    Data_Nasc_Fun = ?, ";
               sql += "    Fone_Fun      = ?, ";
               sql += "    Estado_Fun    = ?, ";
               sql += "    Cidade_Fun    = ?, ";
               sql += "    Bairro_Fun    = ?, ";
               sql += "    Cep_Fun       = ?, ";
               sql += "    Endereco_Fun  = ? ";
               sql += "where Cod_Fun     = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString  (1,        this.Nome_Fun);
            stm.setString  (2,        this.Cpf_Fun);
            stm.setString  (3,        this.RG_Fun);
            stm.setString  (4,        this.Sexo_Fun);
            stm.setDate    (5, (Date) this.Data_Nasc_Fun);
            stm.setString  (6,        this.Fone_Fun);
            stm.setString  (7,        this.Estado_Fun);
            stm.setString  (8,       this.Cidade_Fun);
            stm.setString  (9,       this.Bairro_Fun);
            stm.setInt     (10,       this.Cep_Fun);
            stm.setString  (11,       this.Endereco_Fun);
            stm.setInt     (12,       this.Cod_Fun);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR FUNCIONARIO
    public boolean excluirFuncionario() throws ClassNotFoundException{
        String sql =  "delete from funcionario ";
               sql += "where Cod_Fun = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, this.Cod_Fun);
            stm.execute();
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //CONSULTAR FUNCIONARIO
    public Funcionario consultarFuncionario(int pCod_Fun) throws SQLException, ClassNotFoundException{
        Connection con = Conexao.conectar();
        String sql  = "insert into funcionario Nome_Fun,Cpf_Fun,RG_Fun, ";
               sql += "Sexo_Fun,Data_Nasc_Fun,Fone_Fun,Estado_Fun, ";
               sql += "Cidade_Fun,Bairro_Fun,Cep_Fun,Endereco_Fun ";
               sql += "from funcionario ";
               sql += "where Cod_Fun = ? ";
               sql += "order by Cod_Fun ";
        Funcionario fun = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_Fun);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                fun = new Funcionario();
                fun.setCod_Fun      (pCod_Fun);
                fun.setNome_Fun     (rs.getString ("Nome_Fun"));
                fun.setCpf_Fun      (rs.getString ("Cpf_Fun"));
                fun.setRG_Fun       (rs.getString ("RG_Fun"));
                fun.setSexo_Fun     (rs.getString ("Sexo_Fun"));
                fun.setData_Nasc_Fun(rs.getDate   ("Data_Nasc_Fun"));
                fun.setFone_Fun     (rs.getString ("Fone_Fun"));
                fun.setEstado_Fun   (rs.getString ("Estado_Fun"));
                fun.setCidade_Fun   (rs.getString ("Cidade_Fun"));
                fun.setBairro_Fun   (rs.getString ("Bairro_Fun"));
                fun.setCep_Fun      (rs.getInt    ("Cep_Fun"));
                fun.setEndereco_Fun (rs.getString ("Endereco_Fun"));
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return fun;
    }
    
    //CONSULTAR TODOS OS FUNCIONARIOS
    public List<Funcionario> consultarTodosFuncionarios () throws SQLException, ClassNotFoundException{
        List<Funcionario> listafun = new ArrayList<>();
        Connection con = Conexao.conectar();
        String sql  = "insert into funcionario Nome_Fun,Cpf_Fun,RG_Fun, ";
               sql += "Sexo_Fun,Data_Nasc_Fun,Fone_Fun,Estado_Fun, ";
               sql += "Cidade_Fun,Bairro_Fun,Cep_Fun,Endereco_Fun ";
               sql += "from funcionario ";
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           ResultSet rs = stm.executeQuery();
           while (rs.next()){
               Funcionario fun = new Funcionario();
               fun.setCod_Fun      (rs.getInt    ("Cod_Fun"));
               fun.setNome_Fun     (rs.getString ("Nome_Fun"));
               fun.setCpf_Fun      (rs.getString ("Cpf_Fun"));
               fun.setRG_Fun       (rs.getString ("RG_Fun"));
               fun.setSexo_Fun     (rs.getString ("Sexo_Fun"));
               fun.setData_Nasc_Fun(rs.getDate   ("Data_Nasc_Fun"));
               fun.setFone_Fun     (rs.getString ("Fone_Fun"));
               fun.setEstado_Fun   (rs.getString ("Estado_Fun"));
               fun.setCidade_Fun   (rs.getString ("Cidade_Fun"));
               fun.setBairro_Fun   (rs.getString ("Bairro_Fun"));
               fun.setCep_Fun      (rs.getInt    ("Cep_Fun"));
               fun.setEndereco_Fun (rs.getString ("Endereco_Fun"));
               listafun.add(fun); 
            }
       }catch (SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage());
       }
       return listafun;
    }

   
    public int getCod_Fun() {
        return Cod_Fun;
    }

    
    public void setCod_Fun(int Cod_Fun) {
        this.Cod_Fun = Cod_Fun;
    }

    
    public String getNome_Fun() {
        return Nome_Fun;
    }

    
    public void setNome_Fun(String Nome_Fun) {
        this.Nome_Fun = Nome_Fun;
    }

    
    public String getCpf_Fun() {
        return Cpf_Fun;
    }

    
    public void setCpf_Fun(String Cpf_Fun) {
        this.Cpf_Fun = Cpf_Fun;
    }

    
    public String getRG_Fun() {
        return RG_Fun;
    }

    
    public void setRG_Fun(String RG_Fun) {
        this.RG_Fun = RG_Fun;
    }

    
    public String getSexo_Fun() {
        return Sexo_Fun;
    }

    
    public void setSexo_Fun(String Sexo_Fun) {
        this.Sexo_Fun = Sexo_Fun;
    }

    
    public Date getData_Nasc_Fun() {
        return Data_Nasc_Fun;
    }

    
    public void setData_Nasc_Fun(Date Data_Nasc_Fun) {
        this.Data_Nasc_Fun = Data_Nasc_Fun;
    }

    
    public String getFone_Fun() {
        return Fone_Fun;
    }

    
    public void setFone_Fun(String Fone_Fun) {
        this.Fone_Fun = Fone_Fun;
    }

 
    public String getEstado_Fun() {
        return Estado_Fun;
    }

    
    public void setEstado_Fun(String Estado_Fun) {
        this.Estado_Fun = Estado_Fun;
    }

    
    public String getCidade_Fun() {
        return Cidade_Fun;
    }

    
    public void setCidade_Fun(String Cidade_Fun) {
        this.Cidade_Fun = Cidade_Fun;
    }

    
    public String getBairro_Fun() {
        return Bairro_Fun;
    }

    
    public void setBairro_Fun(String Bairro_Fun) {
        this.Bairro_Fun = Bairro_Fun;
    }

    
    public int getCep_Fun() {
        return Cep_Fun;
    }

    
    public void setCep_Fun(int Cep_Fun) {
        this.Cep_Fun = Cep_Fun;
    }

    
    public String getEndereco_Fun() {
        return Endereco_Fun;
    }

    
    public void setEndereco_Fun(String Endereco_Fun) {
        this.Endereco_Fun = Endereco_Fun;
    }
   
}

package Classes;

import Conexao.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class Consulta {
    private int    Cod_Consulta;
    private int    Cod_Paci;
    private int    Cod_Med;
    private Date   Data_Consulta;
    private String Horario_Consulta;
    private String Fone_Paciente;
    private String nm_paciente;
    private String nm_medico;
    
    //INCLUIR CONSULTA
    public boolean incluirConsulta () throws SQLException, ClassNotFoundException{
        String sql  = "insert into agendamento_consulta (Cod_Med,Cod_Paci,Data_Consulta,Fone_Paciente,Horario_Consulta) ";
               sql += "values(?,?,?,?,?)";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1,        this.Cod_Med);
            stm.setInt   (2,        this.Cod_Paci);
            stm.setDate  (3, (Date) this.Data_Consulta);
            stm.setString(4,        this.Fone_Paciente);
            stm.setString(5,        this.Horario_Consulta);
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //ALTERAR CONSULTA
    public boolean alterarConsulta () throws SQLException, ClassNotFoundException{
        String sql  = "update agendamento_consulta ";
               sql += "set Data_Consulta       = ?, ";
               sql += "    Horario_Consulta    = ?, ";
               sql += "    Fone_Paciente       = ?  ";
               sql += "where Cod_Consulta      = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setDate  (1, (Date) this.Data_Consulta);
            stm.setString(2,        this.Horario_Consulta);
            stm.setString(3,        this.Fone_Paciente);
            stm.setInt   (4,        this.Cod_Consulta);
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR CONSULTA
    public boolean excluirConsulta (int cdCodigoConsulta) throws SQLException, ClassNotFoundException{
        String sql  = "delete from agendamento_consulta ";
               sql += "where Cod_Consulta = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt   (1,         cdCodigoConsulta);
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
  
    //CONSULTAR CONSULTA
    public Consulta consultarConsulta (int pCod_Consulta, int pCod_Paci, int pCod_Med) throws SQLException, ClassNotFoundException{
        String sql  = "select Cod_Consulta, Cod_Paci, Cod_Med, Data_Consulta, Horario_Consulta, Fone_Paciente ";
               sql += "from agendamento_consulta ";
               sql += "where Cod_Consulta = ? ";
               sql += "order by Cod_Consulta ";   
        Consulta cons = null;
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_Consulta);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                cons = new Consulta();
                cons.setCod_Consulta    (pCod_Consulta);
                cons.setCod_Paci        (rs.getInt   ("Cod_Paci"));
                cons.setCod_Med         (rs.getInt   ("Cod_Med"));
                cons.setData_Consulta   (rs.getDate  ("Data_Consulta"));
                cons.setHorario_Consulta(rs.getString("Horario_Consulta"));
                cons.setFone_Paciente   (rs.getString("Fone_Paciente"));
            }
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage());
        }
        return cons;       
    }
    
    //CONSULTAR TODAS AS CONSULTAS
    public List<Consulta> consultarTodosConsultas () throws SQLException, ClassNotFoundException{
       List<Consulta> listacon = new ArrayList<>();
       Connection con = Conexao.conectar();
       String sql  = "select a.Cod_Consulta, a.Cod_Paci, a.Cod_Med, a.Data_Consulta, a.Horario_Consulta, a.Fone_Paciente, ";
               sql += " (select b.Nome_Med from medico b where b.Cod_Med = a.Cod_med ) nome_medico, ";
               sql += " (select c.Nome_Paci from paciente c where c.Cod_Paci = a.Cod_Paci ) nome_paciente ";             
               sql += "from agendamento_consulta a ";
              sql += "order by a.Cod_Consulta ";  
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            //stm.setInt(1, pCod_Med);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                Consulta cons = new Consulta();
                cons.setCod_Consulta    (rs.getInt   ("Cod_Consulta"));
                cons.setCod_Paci        (rs.getInt   ("Cod_Paci"));
                cons.setCod_Med         (rs.getInt   ("Cod_Med"));
                cons.setData_Consulta   (rs.getDate  ("Data_Consulta"));
                cons.setHorario_Consulta(rs.getString("Horario_Consulta"));
                cons.setFone_Paciente   (rs.getString("Fone_Paciente"));
                cons.setNm_medico(rs.getString("nome_medico"));
                cons.setNm_paciente(rs.getString("nome_paciente"));
                listacon.add(cons);
            }
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage());
        }
        return listacon;       
    }
    
    
    public int getCod_Consulta() {
        return Cod_Consulta;
    }

   
    public void setCod_Consulta(int Cod_Consulta) {
        this.Cod_Consulta = Cod_Consulta;
    }

    
    public int getCod_Paci() {
        return Cod_Paci;
    }

    
    public void setCod_Paci(int Cod_Paci) {
        this.Cod_Paci = Cod_Paci;
    }

    
    public int getCod_Med() {
        return Cod_Med;
    }

    
    public void setCod_Med(int Cod_Med) {
        this.Cod_Med = Cod_Med;
    }

   
    public Date getData_Consulta() {
        return Data_Consulta;
    }

    
    public void setData_Consulta(Date Data_Consulta) {
        this.Data_Consulta = Data_Consulta;
    }

    
    public String getFone_Paciente() {
        return Fone_Paciente;
    }

    
    public void setFone_Paciente(String Fone_Paciente) {
        this.Fone_Paciente = Fone_Paciente;
    }

    public String getHorario_Consulta() {
        return Horario_Consulta;
    }

    public void setHorario_Consulta(String Horario_Consulta) {
        this.Horario_Consulta = Horario_Consulta;
    }

    public String getNm_paciente() {
        return nm_paciente;
    }

    public void setNm_paciente(String nm_paciente) {
        this.nm_paciente = nm_paciente;
    }

    public String getNm_medico() {
        return nm_medico;
    }

    public void setNm_medico(String nm_medico) {
        this.nm_medico = nm_medico;
    }

}

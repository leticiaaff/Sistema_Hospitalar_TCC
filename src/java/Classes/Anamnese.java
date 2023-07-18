package Classes;

import Conexao.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Anamnese {
    private int    nr_sequencia;
    private int    Cod_Paci;
    private int    Cod_Med;
    private Date   Data_Consulta;
    private String Descricao;
    private String nm_paciente;
    private String nm_medico;
    
    //INCLUIR ANAMNESE
    public boolean incluirAnamnese () throws SQLException{
        String sql  = "insert into anamnese (Cod_Paci,Cod_Med,Data_Consulta,Descricao) ";
               sql += "values(?,?,?,?)";  
        Connection con = null;
        try {
            con = Conexao.conectar();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Anamnese.class.getName()).log(Level.SEVERE, null, ex);
        }
        try{
           PreparedStatement stm = con.prepareStatement(sql);
           stm.setInt   (1,       this.Cod_Paci);
           stm.setInt   (2,       this.Cod_Med);
           stm.setDate  (3,(Date) this.Data_Consulta);
           stm.setString(4,       this.Descricao);
           stm.execute();
        }catch(SQLException ex) {
           System.out.println("Erro: "+ ex.getMessage() + sql);
           return false;
        }
        return true;
    }
   
    //ALTERAR ANAMNESE
    public boolean alterarAnamnese () throws SQLException, ClassNotFoundException{
        String sql  = "update anamnese ";
               sql += "set Descricao       = ?, ";
               sql += "    Data_Consulta   = ? ";
               sql += "where nr_sequencia      = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setString(1,        this.Descricao);
            stm.setDate  (2, (Date) this.Data_Consulta);
            stm.setInt   (3,        this.nr_sequencia);
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //EXCLUIR ANAMNESE
    public boolean excluirAnamnese (int nr_sequencia) throws SQLException, ClassNotFoundException{
        String sql  = "delete from anamnese ";
               sql += "where nr_sequencia      = ? ";
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt (1, nr_sequencia);
            stm.execute();
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage() + sql);
            return false;
        }
        return true;
    }
    
    //CONSULTAR ANAMNESE 
    public Anamnese consultarAnamnese(int pCod_Paci, int pCod_Med, Date pData_Consulta) throws SQLException, ClassNotFoundException{
        Connection con = Conexao.conectar();
        String sql  = "select cod_paci, cod_med, data_consulta, descricao ";
               sql += "from anamnese ";
               sql += "where Cod_Paci      = ? "; 
               sql += "  and Cod_Med       = ? ";
               sql += "  and Data_Consulta = ? ";
        Anamnese ana = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt (1,        pCod_Paci);
            stm.setInt (2,        pCod_Med);
            stm.setDate(3, (Date) pData_Consulta);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                ana = new Anamnese();
                ana.setCod_Paci(rs.getInt      ("cod_paci"));
                ana.setCod_Med(rs.getInt       ("cod_med"));
                ana.setData_Consulta(rs.getDate("data_consulta"));
                ana.setDescricao(rs.getString  ("Descricao"));
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return ana;
    }    

    //CONSULTAR TODAS AS ANAMNESES
    public List<Anamnese> consultarTodosAnamnese() throws SQLException, ClassNotFoundException{
        List<Anamnese> listaAna = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "select a.cod_paci, trim(p.nome_paci) nome_paci, ";
                sql += "       a.cod_med, trim(m.nome_med) nome_med,    ";
                sql += "       a.data_consulta, a.descricao ";
                sql += "from anamnese a, ";
                sql += "     paciente p, ";
                sql += "     medico   m  ";
                sql += "where a.Cod_Paci = p.Cod_Paci ";
                sql += "  and a.Cod_Med  = m.Cod_Med  ";
                sql += "order by 1,3,5 desc ";
        Anamnese ana = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                ana = new Anamnese();
                Paciente pac = new Paciente();
                Medico   med = new Medico();
                ana.setCod_Paci(rs.getInt      ("cod_paci"));
                pac.setNome_Paci(rs.getString  ("nome_paci"));
                ana.setCod_Med(rs.getInt       ("cod_med"));
                med.setNome_Med(rs.getString   ("nome_med"));
                ana.setData_Consulta(rs.getDate("data_consulta"));
                ana.setDescricao(rs.getString  ("Descricao"));
                listaAna.add(ana);
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return listaAna;
    }    

    //CONSULTAR TODAS AS ANAMNESES POR PACIENTE E MEDICO
    public List<Anamnese> consultarAnamnesePacMed(int pCod_Paci, int pCod_Med) throws SQLException, ClassNotFoundException{
        List<Anamnese> listaAnaPacMed = new ArrayList<>();
        Connection con = Conexao.conectar();
        String  sql  = "select a.nr_sequencia, a.data_consulta, a.Descricao ";
                sql += "from anamnese a ";
                sql += "where cod_paci = ? ";
                sql += "  and cod_med  = ? ";
                sql += "order by 1 desc ";
        Anamnese ana = null;
        try {
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, pCod_Paci);
            stm.setInt(2, pCod_Med);
            ResultSet rs = stm.executeQuery();
            while (rs.next()){
                ana = new Anamnese();
                ana.setNr_sequencia(rs.getInt("nr_sequencia"));
                ana.setData_Consulta(rs.getDate("data_consulta"));
                ana.setDescricao(rs.getString("Descricao"));
                listaAnaPacMed.add(ana);
            }
        }catch(SQLException ex) {
            System.out.println("Erro: "+ ex.getMessage());
        }
        return listaAnaPacMed;
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

    
    public String getDescricao() {
        return Descricao;
    }

    
    public void setDescricao(String Descricao) {
        this.Descricao = Descricao;
    }

//    public Anamnese consultarAnamnese(int i) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }

    public Anamnese consultarAnamnese (int nr_sequencia) throws SQLException, ClassNotFoundException{
        String sql  = "select a.nr_sequencia, a.Cod_Paci, a.Cod_Med, a.Data_Consulta, a.Descricao, ";
               sql += " (select b.Nome_Med from medico b where b.Cod_Med = a.Cod_med ) nome_medico, ";
               sql += " (select c.Nome_Paci from paciente c where c.Cod_Paci = a.Cod_Paci ) nome_paciente ";
               sql += "from anamnese a ";
               sql += "where a.nr_sequencia = ? ";   
        Anamnese anamnese = null;
        Connection con = Conexao.conectar();
        try{
            PreparedStatement stm = con.prepareStatement(sql);
            stm.setInt(1, nr_sequencia);
            ResultSet rs = stm.executeQuery();
            if (rs.next()){
                anamnese = new Anamnese();
                anamnese.setNr_sequencia(rs.getInt("nr_sequencia"));
                anamnese.setCod_Paci        (rs.getInt   ("Cod_Paci"));
                anamnese.setCod_Med         (rs.getInt   ("Cod_Med"));
                anamnese.setData_Consulta   (rs.getDate  ("Data_Consulta"));
                anamnese.setDescricao(rs.getString("Descricao"));
                anamnese.setNm_medico(rs.getString("nome_medico"));
                anamnese.setNm_paciente(rs.getString("nome_paciente"));
            }
        }catch(SQLException ex){
            System.out.println("Erro: "+ ex.getMessage());
        }
        return anamnese;       
    }
        
    public int getNr_sequencia() {
        return nr_sequencia;
    }

    public void setNr_sequencia(int nr_sequencia) {
        this.nr_sequencia = nr_sequencia;
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

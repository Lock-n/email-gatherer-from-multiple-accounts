package bd.daos;

import java.sql.*;

import com.sun.javafx.scene.layout.region.Margins.Converter;

import bd.*;
import bd.core.*;
import bd.dbos.*;

public class EmailAccounts
{
    public static boolean cadastrado (String email) throws Exception
    {
        boolean retorno = false;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_Email_Account " +
                  "WHERE Email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, email);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            retorno = resultado.first(); // pode-se usar resultado.last() ou resultado.next() ou resultado.previous() ou resultado.absotule(numeroDaLinha)
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar Conta de Email: " + erro.getMessage());
        }

        return retorno;
    }

    public static void incluir (EmailAccount contaE) throws Exception
    {
        if (contaE==null)
            throw new Exception ("Conta nao fornecido");

        try
        {
            String sql;

            sql = "INSERT INTO TDI_project_Email_Account " +
                  "(email, password, server_send_address, server_receive_address, server_send_protocol, server_receive_protocol, server_send_port, server_receive_port, name_user) " +
                  "VALUES " +
                  "(?,?,?,?,?,?,?,?,?)";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getEmail                   ());
            BDSQLServer.COMANDO.setString (2, contaE.getPassword                ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_send_address     ());
            BDSQLServer.COMANDO.setString (4, contaE.getServer_receive_address  ());
            BDSQLServer.COMANDO.setString (5, contaE.getServer_send_protocol    ());
            BDSQLServer.COMANDO.setString (6, contaE.getServer_receive_protocol ());
            BDSQLServer.COMANDO.setInt    (7, contaE.getServer_send_port        ());
            BDSQLServer.COMANDO.setInt    (8, contaE.getServer_receive_port     ());
            BDSQLServer.COMANDO.setString (9, contaE.getNameUser                ());    
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao inserir Conta: " + erro.getMessage());
        }
    }

    public static void excluir (String email) throws Exception
    {
        if (!cadastrado (email))
            throw new Exception ("Conta nao cadastrada");

        try
        {
            String sql;

            sql = "DELETE FROM TDI_project_Email_Account " +
                  "WHERE email=?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, email);

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao excluir conta");
        }
    }

    public static void alterar (EmailAccount contaE) throws Exception
    {
        if (contaE==null)
            throw new Exception ("Conta nao fornecida");

        if (!cadastrado (contaE.getEmail()))
            throw new Exception ("Conta nao cadastrada");

        try
        {
            String sql;

            sql = "UPDATE TDI_project_Email_Account " +
                  "SET password=?, server_send_address=?, server_receive_address=?, server_send_protocol=?, server_receive_protocol=?, server_send_port=?, server_receive_port=? "+
                  "WHERE email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);       
            
            BDSQLServer.COMANDO.setString (1, contaE.getPassword                ());
            BDSQLServer.COMANDO.setString (2, contaE.getServer_send_address     ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_receive_address  ());            
            BDSQLServer.COMANDO.setString (4, contaE.getServer_send_protocol    ());
            BDSQLServer.COMANDO.setString (5, contaE.getServer_receive_protocol ());
            BDSQLServer.COMANDO.setInt    (6, contaE.getServer_send_port        ());
            BDSQLServer.COMANDO.setInt    (7, contaE.getServer_receive_port     ());
            BDSQLServer.COMANDO.setString (8, contaE.getEmail                   ());

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao atualizar Conta de Email: " + erro.getMessage());
        }
    }

    public static MeuResultSet getEmailAccounts () throws Exception
    {
        MeuResultSet resultado = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_Email_Account";

            BDSQLServer.COMANDO.prepareStatement (sql);

            resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao recuperar contas de email");
        }

        return resultado;
    }
 

    public static MeuResultSet getEmailAccountsByUser (String name_user) throws Exception
    {
        EmailAccount contaE = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_Email_Account " +
                  "WHERE name_user = ?";
            
            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, name_user);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            if (!resultado.first())
                throw new Exception ("Usuario nao cadastrado");

            
            return resultado;
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar conta de email");
        }
    }

    
    public static EmailAccount getEmailAccountByEmail (String email) throws Exception
    {
        EmailAccount contaE = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_Email_Account " +
                  "WHERE email = ?";
            
            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, email);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

           if (!resultado.first())
                throw new Exception ("conta nao cadastrado");

            
           contaE = new EmailAccount(email, resultado.getString("password"), resultado.getString("server_send_address"), 
        		   resultado.getString("server_receive_address"), resultado.getString("server_send_protocol"),
        		   resultado.getString("server_receive_protocol"), resultado.getInt("server_send_port"),
        		   resultado.getInt("server_receive_port"), resultado.getString("name_user"));
           /*
           contaE.setEmail(resultado.getString("email"));
            contaE.setPassword(resultado.getString("password"));
            
            contaE.setServer_send_address(resultado.getString("server_send_address"));
            contaE.setServer_receive_address(resultado.getString("server_receive_address"));
            
            contaE.setServer_send_protocol(resultado.getString("server_send_protocol"));
            contaE.setServer_receive_protocol(resultado.getString("server_receive_protocol"));
            
            contaE.setServer_send_port(resultado.getInt("server_send_port"));
            contaE.setServer_receive_port(resultado.getInt("server_receive_port"));
            
            contaE.setNameUser(resultado.getString("name_user"));*/
            
            
            
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar conta de email");
        }
        
        return contaE;
    }
    
    
}
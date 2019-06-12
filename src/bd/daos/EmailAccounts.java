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
                  "(email, password, server_address, server_send_protocol, server_receive_protocol, server_send_port, server_receive_port, name_user) " +
                  "VALUES " +
                  "(?,?,?,?,?,?,?,?)";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getEmail                   ());
            BDSQLServer.COMANDO.setString (2, contaE.getPassword                ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_address          ());
            BDSQLServer.COMANDO.setString (4, contaE.getServer_send_protocol    ());
            BDSQLServer.COMANDO.setString (5, contaE.getServer_receive_protocol ());
            BDSQLServer.COMANDO.setInt    (6, contaE.getServer_send_port    ());
            BDSQLServer.COMANDO.setInt    (7, contaE.getServer_receive_port     ());
            BDSQLServer.COMANDO.setString (8, contaE.getNameUser                ());    
            

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
                  "SET password=?, server_send_protocol=?, server_receive_protocol=?, server_send_port=?, server_receive_port=? "+
                  "WHERE email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);       
            
            BDSQLServer.COMANDO.setString (1, contaE.getPassword                ());
            BDSQLServer.COMANDO.setString (2, contaE.getServer_send_protocol    ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_receive_protocol ());
            BDSQLServer.COMANDO.setInt    (4, contaE.getServer_send_port    ());
            BDSQLServer.COMANDO.setInt    (5, contaE.getServer_receive_port     ());
            BDSQLServer.COMANDO.setString (6, contaE.getEmail                   ());
            
            
            
            BDSQLServer.COMANDO.setString (4, contaE.getEmail           ());

            

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
        


}
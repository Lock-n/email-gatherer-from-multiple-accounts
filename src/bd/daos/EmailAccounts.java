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
                  "FROM TDI_project_User_Email_Accounts " +
                  "WHERE Email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, email);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            retorno = resultado.first(); // pode-se usar resultado.last() ou resultado.next() ou resultado.previous() ou resultado.absotule(numeroDaLinha)

            /* // ou, se preferirmos,

            String sql;

             sql = "SELECT * " +
                  "FROM USUARIO " +
                  "WHERE NICK = ?";
                  
            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, nick);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            resultado.first();

            retorno = resultado.getInt("QUANTOS") != 0;

            */
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar Conta de Email");
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

            sql = "INSERT INTO TDI_project_User_Email_Accounts " +
                  "(email, password, server_address, server_protocol, server_port) " +
                  "VALUES " +
                  "(?,?,?,?,?)";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getEmail       ());
            BDSQLServer.COMANDO.setString (2, contaE.getPassword       ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_address  ());
            BDSQLServer.COMANDO.setString (4, contaE.getServer_protocol     ());
            BDSQLServer.COMANDO.setInt    (5, contaE.getServer_port     ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao inserir Conta");
        }
    }

    public static void excluir (String email) throws Exception
    {
        if (!cadastrado (email))
            throw new Exception ("Conta nao cadastrada");

        try
        {
            String sql;

            sql = "DELETE FROM TDI_project_User_Email_Accounts " +
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
                  "SET password=?,SET server_address=?,SET server_protocol=?,SET server_port=?,"+
                  "WHERE email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getPassword       ());
            BDSQLServer.COMANDO.setString (2, contaE.getServer_address  ());
            BDSQLServer.COMANDO.setString (3, contaE.getServer_protocol     ());
            BDSQLServer.COMANDO.setInt    (4, contaE.getServer_port     ());
            BDSQLServer.COMANDO.setString (5, contaE.getEmail       ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao atualizar Conta de Email");
        }
    }

    public static EmailAccount getTDI_project_User_Email_Accounts (String email) throws Exception
    {
        EmailAccount contaE = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_User_Email_Accounts " +
                  "WHERE email = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, email);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            if (!resultado.first())
                throw new Exception ("Usuario nao cadastrado");

            
            contaE = new EmailAccount (resultado.getString("email"), resultado.getString("password"), 
                                    resultado.getString("server_address"), resultado.getString("server_protocol"),
                                    resultado.getInt("server_port"));
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar conta de email");
        }

        return contaE;
    }

    public static MeuResultSet getContasEmails () throws Exception
    {
        MeuResultSet resultado = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_User_Email_Accounts";

            BDSQLServer.COMANDO.prepareStatement (sql);

            resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao recuperar contas de email");
        }

        return resultado;
    }
}
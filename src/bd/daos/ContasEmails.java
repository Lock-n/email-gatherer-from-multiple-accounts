package bd.daos;

import java.sql.*;

import com.sun.javafx.scene.layout.region.Margins.Converter;

import bd.*;
import bd.core.*;
import bd.dbos.*;

public class ContasEmails
{
    public static boolean cadastrado (String login) throws Exception
    {
        boolean retorno = false;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM ContaEmail " +
                  "WHERE Login = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, login);

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

    public static void incluir (ContaEmail contaE) throws Exception
    {
        if (contaE==null)
            throw new Exception ("Conta nao fornecido");

        try
        {
            String sql;

            sql = "INSERT INTO ContaEmail " +
                  "(LOGIN, SENHA, endServEnv, protEnv, portEnv, endServRec, protRec, portRec) " +
                  "VALUES " +
                  "(?,?,?,?,?,?,?,?)";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getLogin       ());
            BDSQLServer.COMANDO.setString (2, contaE.getSenha       ());
            BDSQLServer.COMANDO.setString (3, contaE.getEndServEnv  ());
            BDSQLServer.COMANDO.setString (4, contaE.getProtEnv     ());
            BDSQLServer.COMANDO.setInt    (5, contaE.getPortEnv     ());
            BDSQLServer.COMANDO.setString (6, contaE.getEndServRec  ());
            BDSQLServer.COMANDO.setString (7, contaE.getProtRec     ());
            BDSQLServer.COMANDO.setInt    (8, contaE.getPortRec     ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao inserir Conta");
        }
    }

    public static void excluir (String login) throws Exception
    {
        if (!cadastrado (login))
            throw new Exception ("Conta nao cadastrada");

        try
        {
            String sql;

            sql = "DELETE FROM ContaEmail " +
                  "WHERE LOGIN=?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, login);

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao excluir conta");
        }
    }

    public static void alterar (ContaEmail contaE) throws Exception
    {
        if (contaE==null)
            throw new Exception ("Conta nao fornecida");

        if (!cadastrado (contaE.getLogin()))
            throw new Exception ("Conta nao cadastrada");

        try
        {
            String sql;

            sql = "UPDATE USUARIO " +
                  "SET SENHA=?,SET endServEnv=?,SET protEnv=?,SET portEnv=?,"+
                  "SET endServRec=?, SET protRec=?, SET portRec=?" +
                  "WHERE Login = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, contaE.getSenha       ());
            BDSQLServer.COMANDO.setString (2, contaE.getEndServEnv  ());
            BDSQLServer.COMANDO.setString (3, contaE.getProtEnv     ());
            BDSQLServer.COMANDO.setInt    (4, contaE.getPortEnv     ());
            BDSQLServer.COMANDO.setString (5, contaE.getEndServRec  ());
            BDSQLServer.COMANDO.setString (6, contaE.getProtRec     ());
            BDSQLServer.COMANDO.setInt    (7, contaE.getPortRec     ());
            BDSQLServer.COMANDO.setString (8, contaE.getLogin       ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao atualizar Conta de Email");
        }
    }

    public static ContaEmail getContaEmail (String login) throws Exception
    {
        ContaEmail contaE = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM ContaEmail " +
                  "WHERE login = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, login);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            if (!resultado.first())
                throw new Exception ("Usuario nao cadastrado");

            
            contaE = new ContaEmail (resultado.getString("LOGIN"), resultado.getString("SENHA"), 
                                    resultado.getString("endServEnv"), resultado.getString("protEnv"),
                                    resultado.getInt("portEnv"), resultado.getString("endServRec"),
                                    resultado.getString("protRec"), resultado.getInt("portRec"));
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
                  "FROM ContaEmail";

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
package bd.daos;

import java.sql.*;
import bd.*;
import bd.core.*;
import bd.dbos.*;

public class Users
{
    public static boolean cadastrado (String name) throws Exception
    {
        boolean retorno = false;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_User " +
                  "WHERE NAME = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, name);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            retorno = resultado.first(); // pode-se usar resultado.last() ou resultado.next() ou resultado.previous() ou resultado.absotule(numeroDaLinha)

            /* // ou, se preferirmos,

            String sql;

             sql = "SELECT * " +
                  "FROM TDI_project_User " +
                  "WHERE NAME = ?";
                  
            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, name);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            resultado.first();

            retorno = resultado.getInt("QUANTOS") != 0;

            */
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar usuario");
        }

        return retorno;
    }

    public static void incluir (User usuario) throws Exception
    {
        if (usuario==null)
            throw new Exception ("User nao fornecido");

        try
        {
            String sql;

            sql = "INSERT INTO TDI_project_User " +
                  "(NAME,PASSWORD) " +
                  "VALUES " +
                  "(?,?)";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, usuario.getName ());
            BDSQLServer.COMANDO.setString (2, usuario.getPassword ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao inserir usuario");
        }
    }

    public static void excluir (String name) throws Exception
    {
        if (!cadastrado (name))
            throw new Exception ("User nao cadastrado");

        try
        {
            String sql;

            sql = "DELETE FROM TDI_project_User " +
                  "WHERE NAME=?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, name);

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao excluir usuario");
        }
    }

    public static void alterar (User usuario) throws Exception
    {
        if (usuario==null)
            throw new Exception ("User nao fornecido");

        if (!cadastrado (usuario.getName()))
            throw new Exception ("User nao cadastrado");

        try
        {
            String sql;

            sql = "UPDATE TDI_project_User " +
                  "SET PASSWORD=? " +
                  "WHERE NAME = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1, usuario.getPassword ());
            BDSQLServer.COMANDO.setString (2, usuario.getName ());
            

            BDSQLServer.COMANDO.executeUpdate ();
            BDSQLServer.COMANDO.commit        ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao atualizar senha do usuario");
        }
    }

    public static User getUser (String name) throws Exception
    {
        User usuario = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_User " +
                  "WHERE NAME = ?";

            BDSQLServer.COMANDO.prepareStatement (sql);

            BDSQLServer.COMANDO.setString (1,name);

            MeuResultSet resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();

            if (!resultado.first())
                throw new Exception ("User nao cadastrado");

            usuario = new User (resultado.getString("name"),
                                   resultado.getString("password"));
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao procurar usuario");
        }

        return usuario;
    }

    public static MeuResultSet getUsers () throws Exception
    {
        MeuResultSet resultado = null;

        try
        {
            String sql;

            sql = "SELECT * " +
                  "FROM TDI_project_User";

            BDSQLServer.COMANDO.prepareStatement (sql);

            resultado = (MeuResultSet)BDSQLServer.COMANDO.executeQuery ();
        }
        catch (SQLException erro)
        {
            throw new Exception ("Erro ao recuperar usuarios");
        }

        return resultado;
    }
}
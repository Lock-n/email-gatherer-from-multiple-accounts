package bd.dbos;

public class User implements Cloneable
{
    private String name;
    private String password;
 
    public void setName (String name) throws Exception
    {
        if (name==null || name.equals(""))
            throw new Exception ("name não fornecido");

        this.name = name;
    }   

    public void setPassword (String password) throws Exception
    {
        if (password==null || password.equals(""))
            throw new Exception ("name nao fornecido");

        this.password = password;
    }

    public String getName ()
    {
        return this.name;
    }

    public String getPassword()
    {
        return this.password;
    }

    public User (String name, String password) throws Exception
    {
        this.setName   (name);
        this.setPassword  (password);
    }

    public String toString ()
    {
        String ret="";

        ret+="Name..: "+this.name  +"\n";
        ret+="Password.: "+this.password;

        return ret;
    }

    public boolean equals (Object obj)
    {
        if (this==obj)
            return true;

        if (obj==null)
            return false;

        if (!(obj instanceof User))
            return false;

        User usu = (User)obj;

        if (this.name.equals(usu.name))
            return false;
            
        if (this.password.equals(usu.password))
            return false;

        return true;
    }

    public int hashCode ()
    {
        int ret=666;


        ret = 7*ret + this.name.hashCode();
        ret = 7*ret + this.password.hashCode();

        return ret;
    }


    public User (User modelo) throws Exception
    {
        this.name   = modelo.name;   // nao clono, pq nao eh clonavel
        this.password  = modelo.password;  // nao clono, pq nao eh clonavel
    }

    public Object clone ()
    {
        User ret=null;

        try
        {
            ret = new User (this);
        }
        catch (Exception erro)
        {} // nao trato, pq this nunca é null e construtor de
           // copia da excecao qdo seu parametro for null

        return ret;
    }
}
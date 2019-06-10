package bd.dbos;

public class EmailAccount implements Cloneable
{
    private String email;
    private String password;
    private String server_address;  // endereco do servidor de env
    private String server_protocol;		// protocolo de envio 
    private int    server_port;		// porta de envio
    private String name_user;        //nome do dono da conta
    
    
     
	public void setEmail(String email)throws Exception
	{
		if (email==null || email.equals(""))
            throw new Exception ("email não fornecido");
		this.email = email;
	}

	public void setPassword(String password)throws Exception 
	{
		if (password==null || password.equals(""))
            throw new Exception ("password não fornecida");
		this.password = password;
	}

	public void setServer_address(String server_address)throws Exception
	{
		if (server_address==null || server_address.equals(""))
            throw new Exception ("endereco do servidor de envio não fornecido");
		this.server_address = server_address;
	}

	public void setServer_protocol(String server_protocol)throws Exception
	{
		if (server_protocol==null || server_protocol.equals(""))
            throw new Exception ("protocolo de envio não fornecido");
		this.server_protocol = server_protocol;
	}

	public void setServer_port(int server_port)throws Exception
	{
		if (server_port <= 0)
            throw new Exception ("Porta de envio invalida");
		this.server_port = server_port;
	}
    
    public void setnameUser(String name_user)throws Exception
	{
		if (name_user==null || name_user.equals(""))
            throw new Exception ("nome de usuario não fornecido");
		this.name_user = name_user;
	}

    public String getEmail() {
		return this.email;
	}

	public String getPassword() {
		return this.password;
	}

	public String getServer_address() {
		return this.server_address;
	}

	public String getServer_protocol() {
		return this.server_protocol;
	}

	public int getServer_port() {
		return this.server_port;
	}
    
    public String getNameUser() {
		return this.name_user;
	}

    public EmailAccount(String email, String password, String server_address, String server_protocol, int server_port, String name_user)
    {
		this.email                = email;
		this.password             = password;
		this.server_address       = server_address;
		this.server_protocol      = server_protocol;
		this.server_port          = server_port;
        this.name_user          = name_user;
	}

	public String toString() 
    {
		String  ret = ""; 
				ret += "email=" + email;
				ret += "\n password=" + password;
				ret+=  "\n server_address=" + server_address;
				ret+=  "\n server_protocol=" + server_protocol;
				ret+=  "\n server_port=" + server_port;
                ret+=  "\n name_user=" + name_user;
		
		return ret;
	}
	

	public int hashCode() {
		int ret = 1;

		ret = 7 * ret + email.hashCode();
		ret = 7 * ret + password.hashCode();
		ret = 7 * ret + server_address.hashCode();
		ret = 7 * ret + server_protocol.hashCode();
		ret = 7 * ret + new Integer(server_port).hashCode();
        ret = 7 * ret + name_user.hashCode();
		
		return ret;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (!(obj instanceof EmailAccount))
			return false;
		
		EmailAccount conEmail = (EmailAccount) obj;
		
		 if (!this.email.equals(conEmail.email))
			 return false;
		 
		if (!this.password.equals(conEmail.password))
			return false;
		 
		if (this.server_address != conEmail.server_address)
			return false;
		
		if (!this.server_protocol.equals(conEmail.server_protocol))
		return false;
		
		if (this.server_port != conEmail.server_port)
			return false;
            
        if (!this.name_user.equals(conEmail.name_user))
			 return false;
		
		return true;
	}



    public EmailAccount (EmailAccount modelo) throws Exception
    {
    	this.email      = modelo.email;      	// nao clono, pq nao eh clonavel
    	this.password      = modelo.password;			// nao clono, pq nao eh clonavel
    	this.server_address = modelo.server_address;	// nao clono, pq nao eh clonavel
    	this.server_protocol    = modelo.server_protocol; 		// nao clono, pq nao eh clonavel
    	this.server_port    = modelo.server_port;		// nao clono, pq nao eh objeto
        this.name_user    = modelo.name_user;
    }

    public Object clone ()
    {
        EmailAccount ret=null;

        try
        {
            ret = new EmailAccount (this);
        }
        catch (Exception erro)
        {} // nao trato, pq this nunca é null e construtor de
           // copia da excecao qdo seu parametro for null

        return ret;
    }
}
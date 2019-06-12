package bd.dbos;

public class EmailAccount implements Cloneable
{
	
    private String email;
    private String password;
    private String server_send_address;  // endereco do servidor de env
    private String server_receive_address;  // endereco do servidor de recebimento
    private String server_send_protocol;	// protocolo de envio 
    private String server_receive_protocol;	// protocolo de recebimento
    private int    server_send_port;		// porta de envio
    private int    server_receive_port;		// porta de recebimento
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

	public void setServer_send_address(String server_send_address)throws Exception
	{
		if (server_send_address==null || server_send_address.equals(""))
            throw new Exception ("Endereco do servidor de envio não fornecido");
		this.server_send_address = server_send_address;
	}

	public void setServer_receive_address(String server_receive_address)throws Exception
	{
		if (server_receive_address==null || server_receive_address.equals(""))
            throw new Exception ("Endereco do servidor de recebimento não fornecido");
		this.server_receive_address = server_receive_address;
	}

	public void setServer_send_protocol(String server_send_protocol)throws Exception
	{
		if (server_send_protocol==null || server_send_protocol.equals(""))
            throw new Exception ("Protocolo de envio não fornecido");
		this.server_send_protocol = server_send_protocol;
	}

	public void setServer_receive_protocol(String server_receive_protocol)throws Exception
	{
		if (server_receive_protocol==null || server_receive_protocol.equals(""))
            throw new Exception ("Protocolo de recebimento não fornecido");
		this.server_receive_protocol = server_receive_protocol;
	}

	public void setServer_send_port(int server_send_port)throws Exception
	{
		if (server_send_port <= 0)
            throw new Exception ("Porta de envio invalida");
		this.server_send_port = server_send_port;
	}

	public void setServer_receive_port(int server_receive_port)throws Exception
	{
		if (server_receive_port <= 0)
            throw new Exception ("Porta de recebimento invalida");
		this.server_receive_port = server_receive_port;
	}
    
    public void setNameUser(String name_user)throws Exception
	{
		if (name_user==null || name_user.equals(""))
            throw new Exception ("Nome de usuario não fornecido");
		this.name_user = name_user;
	}

    public String getEmail() {
		return this.email;
	}

	public String getPassword() {
		return this.password;
	}

	public String getServer_send_address() {
		return this.server_send_address;
	}

	public String getServer_receive_address() {
		return this.server_receive_address;
	}

	public String getServer_send_protocol() {
		return this.server_send_protocol;
	}

	public String getServer_receive_protocol() {
		return this.server_receive_protocol;
	}

	public int getServer_send_port() {
		return this.server_send_port;
	}

	public int getServer_receive_port() {
		return this.server_receive_port;
	}
    
    public String getNameUser() {
		return this.name_user;
	}


    
    public EmailAccount(String email, String password, String server_send_address, String server_receive_address, String server_send_protocol, String server_receive_protocol, int server_send_port, int server_receive_port, String name_user)
    {
		this.email                = email;
		this.password             = password;
		this.server_send_address       = server_send_address;
		this.server_receive_address       = server_receive_address;
		this.server_send_protocol      = server_send_protocol;
		this.server_receive_protocol      = server_receive_protocol;
		this.server_send_port          = server_send_port;
		this.server_receive_port          = server_receive_port;
        this.name_user            = name_user;
	}

	public String toString() 
    {
		String  ret = ""; 
				ret += "email=" + email;
				ret += "\n password=" + password;
				ret+=  "\n server_send_address=" + server_send_address;
				ret+=  "\n server_receive_address=" + server_receive_address;
				ret+=  "\n server_send_protocol=" + server_send_protocol;
				ret+=  "\n server_receive_protocol=" + server_receive_protocol;
				ret+=  "\n server_send_port=" + server_send_port;
				ret+=  "\n server_receive_port=" + server_receive_port;
                ret+=  "\n name_user=" + name_user;
		
		return ret;
	}
	

	public int hashCode() {
		int ret = 1;

		ret = 7 * ret + email.hashCode();
		ret = 7 * ret + password.hashCode();
		ret = 7 * ret + server_send_address.hashCode();
		ret = 7 * ret + server_receive_address.hashCode();
		ret = 7 * ret + server_send_protocol.hashCode();
		ret = 7 * ret + server_receive_protocol.hashCode();
		ret = 7 * ret + new Integer(server_send_port).hashCode();
		ret = 7 * ret + new Integer(server_receive_port).hashCode();
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
		 
		if (this.server_send_address != conEmail.server_send_address)
			return false;
		 
		if (this.server_receive_address != conEmail.server_receive_address)
			return false;
		
		if (!this.server_send_protocol.equals(conEmail.server_send_protocol))
		return false;
		
		if (!this.server_receive_protocol.equals(conEmail.server_receive_protocol))
		return false;
		
		if (this.server_send_port != conEmail.server_send_port)
			return false;
		
		if (this.server_receive_port != conEmail.server_receive_port)
			return false;
            
        if (!this.name_user.equals(conEmail.name_user))
			 return false;
		
		return true;
	}



    public EmailAccount (EmailAccount modelo) throws Exception
    {
    	this.email      = modelo.email;      	// nao clono, pq nao eh clonavel
    	this.password      = modelo.password;			// nao clono, pq nao eh clonavel
    	this.server_send_address = modelo.server_send_address;	// nao clono, pq nao eh clonavel
    	this.server_receive_address = modelo.server_receive_address;	// nao clono, pq nao eh clonavel
    	this.server_send_protocol    = modelo.server_send_protocol; 		// nao clono, pq nao eh clonavel
    	this.server_receive_protocol    = modelo.server_receive_protocol; 		// nao clono, pq nao eh clonavel
    	this.server_send_port    = modelo.server_send_port;		// nao clono, pq nao eh objeto
    	this.server_receive_port    = modelo.server_receive_port;		// nao clono, pq nao eh objeto
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
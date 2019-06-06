package bd.dbos;

public class EmailAccount implements Cloneable
{
    private String email;
    private String password;
    private String server_address;  // endereco do servidor de env
    private String protEnv;		// protocolo de envio 
    private int    portEnv;		// porta de envio
    
    
     
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

	public void setEndServEnv(String endServEnv)throws Exception
	{
		if (endServEnv==null || endServEnv.equals(""))
            throw new Exception ("endereco do servidor de envio não fornecido");
		this.endServEnv = endServEnv;
	}

	public void setProtEnv(String protEnv)throws Exception
	{
		if (protEnv==null || protEnv.equals(""))
            throw new Exception ("protocolo de envio não fornecido");
		this.protEnv = protEnv;
	}

	public void setPortEnv(int portEnv)throws Exception
	{
		if (portEnv <= 0)
            throw new Exception ("Porta de envio invalida");
		this.portEnv = portEnv;
	}

	public void setEndServRec(String endServRec) throws Exception
	{
		if (endServRec==null || endServRec.equals(""))
            throw new Exception ("endereco do servidor de recepcao não fornecido");
		this.endServRec = endServRec;
	}

	public void setProtRec(String protRec)throws Exception 
	{
		if (protRec==null || protRec.equals(""))
            throw new Exception ("protocolo  de recepcao não fornecido");
		this.protRec = protRec;
	}

	public void setPortRec(int portRec)throws Exception
	{
		if (portRec <= 0)
            throw new Exception ("Porta de recepcao invalida");
		this.portRec = portRec;
	}



    public String getEmail() {
		return this.email;
	}

	public String getPassword() {
		return this.password;
	}

	public String getEndServEnv() {
		return this.endServEnv;
	}

	public String getProtEnv() {
		return this.protEnv;
	}

	public int getPortEnv() {
		return this.portEnv;
	}

	public String getEndServRec() {
		return this.endServRec;
	}

	public String getProtRec() {
		return this.protRec;
	}

	public int getPortRec() {
		return this.portRec;
	}


    public EmailAccount(String email, String password, String endServEnv, String protEnv, int portEnv, String endServRec,
			String protRec, int portRec)
    {
		this.email      = email;
		this.password      = password;
		this.endServEnv = endServEnv;
		this.protEnv    = protEnv;
		this.portEnv    = portEnv;
		this.endServRec = endServRec;
		this.protRec    = protRec;
		this.portRec    = portRec;
	}

	public String toString() 
    {
		String  ret = ""; 
				ret += "email=" + email;
				ret += "\n password=" + password;
				ret+=  "\n endServEnv=" + endServEnv;
				ret+=  "\n protEnv=" + protEnv;
				ret+=  "\n portEnv=" + portEnv;
				ret+=  "\n endServRec=" + endServRec;
				ret+=  "\n protRec=" + protRec;
				ret+=  "\n portRec="+ portRec;
		
		return ret;
	}
	

	public int hashCode() {
		int ret = 1;

		ret = 7 * ret + email.hashCode();
		ret = 7 * ret + password.hashCode();
		ret = 7 * ret + endServEnv.hashCode();
		ret = 7 * ret + protEnv.hashCode();
		ret = 7 * ret + new Integer(portEnv).hashCode();
		ret = 7 * ret + endServRec.hashCode();
		ret = 7 * ret + new Integer(portRec).hashCode();
		ret = 7 * ret + protRec.hashCode();
		
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
		 
		if (this.endServEnv != conEmail.endServEnv)
			return false;
		
		if (!this.protEnv.equals(conEmail.protEnv))
		return false;
		
		if (this.portEnv != conEmail.portEnv)
			return false;
		
		if (!this.endServRec.equals(conEmail.endServRec))
			return false;
		
		if (!this.protRec.equals(conEmail.protRec))
			return false;
		
		if (this.portRec != conEmail.portRec)
			return false;
		
		return true;
	}



    public EmailAccount (EmailAccount modelo) throws Exception
    {
    	this.email      = modelo.email;      	// nao clono, pq nao eh clonavel
    	this.password      = modelo.password;			// nao clono, pq nao eh clonavel
    	this.endServEnv = modelo.endServEnv;	// nao clono, pq nao eh clonavel
    	this.protEnv    = modelo.protEnv; 		// nao clono, pq nao eh clonavel
    	this.portEnv    = modelo.portEnv;		// nao clono, pq nao eh objeto
    	this.endServRec = modelo.endServRec;	// nao clono, pq nao eh clonavel
    	this.protRec    = modelo.protRec;		// nao clono, pq nao eh clonavel
    	this.portRec    = modelo.portRec;		// nao clono, pq nao eh objeto
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
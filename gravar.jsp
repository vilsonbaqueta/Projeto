<%@page language="java" import="java.sql.*" %>

<%

	// cria as variaveis e obtem os dados digitados pelo usuario
	String vnome  = request.getParameter("txtnome");
	String vtelefone  = request.getParameter("txttelefone");
	String vemail  = request.getParameter("txtemail");
	String vhorario  = request.getParameter("txthorario");

	// variaveis para acessar o banco de dados
	String banco   = "n1webs";
	String usuario = "root";
	String senha   = "";
	String url     = "jdbc:mysql://localhost:3306/" + banco;
	String driver  = "com.mysql.jdbc.Driver";

	// carrega o driver na memoria
	Class.forName( driver );

	// criar variavel para conectar com banco de dados
	Connection conexao ; 

	// abrir a conexao com o banco 
	conexao = DriverManager.getConnection( url , usuario , senha ) ;

	// cria variavel, com código sql para gravar no banco de dados
	String sql = "insert into contato_halo (nome, telefone, email, horario) values('" + vnome + "','" + vtelefone + "','" + vemail  + "', '" + vhorario +"')" ;

	// cria o statement 
	// ele é o responsável por executar o comando do SQL
	Statement stm = conexao.createStatement() ;

	// executa o comando do SQL
	stm.executeUpdate( sql ) ;


	stm.close() ;
	conexao.close() ;

	out.print("<br><br>") ;
	out.print("Dados gravados com sucesso!!!") ;

	out.print("<br><br>") ;
	out.print("<a href='contato.html'>Voltar</a>") ;

%>
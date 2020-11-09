<%@page language="java" import="java.sql.*" %>

<%
	// cria as variaveis para acessar o banco 
	String usuario = "root" ;
	String senha   = ""  ;
	String banco   = "n1webs" ;

	String url     = "jdbc:mysql://localhost:3306/" + banco ;
	String driver  = "com.mysql.jdbc.Driver"  ;

	//carrega o driver na memoria
	Class.forName( driver ) ;

	//criar um objeto para a conexão com BD
	Connection conexao ;

	//Abrir a conexao com o BD
	conexao = DriverManager.getConnection( url, usuario , senha ) ;

	String sql = "SELECT * from contato_halo" ;

	Statement stm = conexao.createStatement() ;

	//Variável para armazenar informações que vem do banco do dados
	ResultSet dados = stm.executeQuery( sql ) ;  //SELECT 

	out.print( "<table border='1'>" ) ;

	out.print( "<tr>" ) ;
		out.print( "<th>Nome</th>" ) ;
		out.print( "<th>Telefone</th>" ) ;
		out.print( "<th>e-mail</th>" ) ;
		out.print( "<th>Horario</th>" ) ;
	out.print( "</tr>" ) ;


	while ( dados.next() ) {
		out.print("<tr>") ;

			out.print("<td>") ;
				out.print(  dados.getString("nome") ) ;
			out.print("</td>") ;

			out.print("<td>") ;
			    out.print(  dados.getString("telefone") ) ;
			out.print("</td>") ;

			out.print("<td>") ;
				out.print(  dados.getString("email") ) ;
			out.print("</td>") ;

			out.print("<td>") ;
				out.print(  dados.getString("horario") ) ;
			out.print("</td>") ;

		out.print("</tr>") ;

	}


	out.print( "</table>" ) ;
	 

%>


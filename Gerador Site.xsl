<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" indent="yes" encoding="UTF-8"/>
	<xsl:template match="text()" priority="-1"/>
	<xsl:template match="/Museu">
	
	<xsl:result-document method="html" href="home.html" undeclare-prefixes="yes">
		<html>
			<head>
				<title><xsl:value-of select="Museu"></xsl:value-of></title>
			</head>
			<body>
				<h2><xsl:text>Museu da Emigração e das Comunidades</xsl:text><br><br></br></br></h2>
				<xsl:text>O Museu da Emigração e das Comunidades, abrev	iadamente MEC, situado na Casa da Cultura da Câmara Municipal de Fafe, em Portugal, é um núcleo museológico que preserva as memórias dos emigrantes portugueses. O museu dá a conhecer o fenômeno da emigração, em particular, aquela que teve como destino o Brasil no final do século XIX e primeiras décadas do século XX, assim como a emigração registada para os países europeus a meio do século XX. O objetivo deste museu passa por dar uma ideia do Portugal do qual se partia na busca de melhores condições de vida e dos mundos para os quais se partia e depois se retornava (ou não) e ajudar a compreender a identidade de uma região, historicamente marcada pelo fenómeno da emigração. Fafe tem ainda hoje bem visíveis as marcas do retorno dos emigrantes que partiram para o Brasil e que, no regresso a Portugal, edificaram casas, jardins, hospitais, asilos, escolas, teatros e indústrias.</xsl:text>
				<li><a href="emigrantes.html">Índice de Emigrantes</a></li>
				<li><a href="localidades.html">Índice de Localidades</a></li>
				<li><a href="processos.html">Processos por numeração</a></li>
			</body>
		</html>
	</xsl:result-document>
	
	<xsl:result-document method="html" href="emigrantes.html" undeclare-prefixes="yes">
		<html>
			<head>
				<title><xsl:value-of select="emigrantes"></xsl:value-of></title>
			</head>
			<body>
				<a href="home.html">Return to home</a>
				<xsl:for-each select="IdentificacaoEmigrante">
					<xsl:sort select="nome" data-type="text" order="ascending"/>
					<li><a href="{./idEmigrante}.html"><xsl:value-of select="./nome"/></a></li>
				</xsl:for-each>
			</body>
		</html>
	</xsl:result-document>
	
	<xsl:result-document method="html" href="localidades.html" undeclare-prefixes="yes">
		<html>
			<head>
				<title><xsl:value-of select="localidade"></xsl:value-of></title>
			</head>
			<body>
				<a href="home.html">Return to home</a>
				<xsl:for-each select="Localidade">
					<xsl:sort select="freguesia" data-type="text" order="ascending"/>
					<li><xsl:text>Freguesia: </xsl:text><xsl:value-of select="./freguesia"/><xsl:text> | Concelho: </xsl:text><xsl:value-of select="./concelho"/><xsl:text> | Distrito: </xsl:text><xsl:value-of select="distrito"/></li>
				</xsl:for-each>
			</body>
		</html>
	</xsl:result-document>
	
	<xsl:result-document method="html" href="processos.html" undeclare-prefixes="yes">
		<html>
			<head>
				<title><xsl:value-of select="processos"></xsl:value-of></title>
			</head>
			<body>
				<a href="home.html">Return to home</a>
				<xsl:for-each select="Processo">
					<li><a href="{./numCM}.html"><xsl:value-of select="./numCM"/></a></li>
				</xsl:for-each>
			</body>
		</html>
	</xsl:result-document>	
	
	<xsl:for-each select="IdentificacaoEmigrante">
		<xsl:sort select="nome" data-type="text" order="ascending"/>
		<xsl:result-document method="html" href="{./idEmigrante}.html" undeclare-prefixes="yes">
			<html>
				<head>
					<title><xsl:value-of select="./nome"></xsl:value-of></title>
				</head>
				<body>
					<a href="emigrantes.html">Return to index</a>
					<li><xsl:text>ID: </xsl:text><xsl:value-of select="./idEmigrante"></xsl:value-of></li>
					<li><xsl:text>Nome: </xsl:text><xsl:value-of select="./nome"></xsl:value-of></li>
					<li><xsl:text>Nascimento: </xsl:text><xsl:value-of select="./dtNasc"></xsl:value-of></li>
					<xsl:variable name="filiacao">
						<xsl:value-of select="./idFiliacao"/>
					</xsl:variable>
					<xsl:for-each select="//Filiacao">
						<xsl:if test="idFiliacao = $filiacao">
							<li><xsl:text>Nome do Pai: </xsl:text><xsl:value-of select="nomePai"></xsl:value-of></li>
							<li><xsl:text>Nome da Mãe: </xsl:text><xsl:value-of select="nomeMae"></xsl:value-of></li>
						</xsl:if>						
					</xsl:for-each>
					
					<xsl:variable name="local">
						<xsl:value-of select="./idNaturalidade"/>
					</xsl:variable>
					<xsl:for-each select="//Localidade">
						<xsl:if test="idLocalidade = $local">
							<li><xsl:text>Freguesia: </xsl:text><xsl:value-of select="freguesia"></xsl:value-of></li>
							<li><xsl:text>Concelho: </xsl:text><xsl:value-of select="concelho"></xsl:value-of></li>
							<li><xsl:text>Distrito: </xsl:text><xsl:value-of select="distrito"></xsl:value-of></li>
						</xsl:if>						
					</xsl:for-each>
					
					<xsl:variable name="emigr">
						<xsl:value-of select="./idEmigrante"/>
					</xsl:variable>
					<xsl:for-each select="//Processo">
						<xsl:if test="idEmigrante = $emigr">
							<li><a href="{./numCM}.html">Processo <xsl:value-of select="./numCM"/></a></li>
						</xsl:if>
					</xsl:for-each>
				</body>
			</html>
		</xsl:result-document>
	</xsl:for-each>
	
	<xsl:for-each select="Processo">
		<xsl:result-document method="html" href="{./numCM}.html" undeclare-prefixes="yes">
			<html>
				<head>
					<title><xsl:value-of select="./numCM"></xsl:value-of></title>
				</head>
				<body>
					<a href="processos.html">Return to index</a>
					<xsl:variable name="CM">
						<xsl:value-of select="./numCM"/>
					</xsl:variable>
					<xsl:for-each select="//ProcessoAcomp">
						<xsl:if test="numCM = $CM">
							<xsl:variable name="acomp">
								<xsl:value-of select="./idAcomp"/>
							</xsl:variable>
							<xsl:for-each select="//Acompanhante">
								<xsl:if test="idAcomp = $acomp">
									<li><xsl:text>Acompanhante: </xsl:text><xsl:value-of select="nome"></xsl:value-of></li>
								</xsl:if>	
							</xsl:for-each>
						</xsl:if>					
					</xsl:for-each>
					
					<xsl:variable name="CM2">
						<xsl:value-of select="./numCM"/>
					</xsl:variable>
					<xsl:for-each select="//ProcessoPessoasFam">
						<xsl:if test="numCM = $CM2">
							<xsl:variable name="ficamPais">
								<xsl:value-of select="./idPessoasFamFicamPais"/>
							</xsl:variable>
							<xsl:for-each select="//PessoasFamFicamPais">
								<xsl:if test="idPessoasFamFicamPais = $ficamPais">
									<li><xsl:text>Familiares: </xsl:text><xsl:value-of select="nome"></xsl:value-of></li>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
					
					<xsl:variable name="CM3">
						<xsl:value-of select="./numCM"/>
					</xsl:variable>
					<xsl:for-each select="//ProcessoAnexo">
						<xsl:if test="numCM = $CM3">
							<xsl:variable name="anexo">
								<xsl:value-of select="./idAnexo"/>
							</xsl:variable>
							<xsl:for-each select="//anexo">
								<xsl:if test="idAnexo = $anexo">
									<li><xsl:text>Anexos: </xsl:text><xsl:value-of select="descricao"></xsl:value-of></li>
								</xsl:if>
							</xsl:for-each>
						</xsl:if>
					</xsl:for-each>
				</body>
			</html>
		</xsl:result-document>
	</xsl:for-each>
	
	</xsl:template>
</xsl:stylesheet>



<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
	<xsl:template match="text()" priority="-1"/>
	<xsl:template match="/pma_xml_export">
	<xsl:text>&#xA;</xsl:text>
	<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
	<xsl:text>Museu</xsl:text>
	<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	<xsl:text>&#xA;</xsl:text>
	
		<xsl:for-each select="database">
			<xsl:for-each select="table">
				<xsl:text>&#x9;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				<xsl:text>&#xA;</xsl:text>
				<xsl:for-each select="column">
					<xsl:text>&#x9;</xsl:text>
					<xsl:text>&#x9;</xsl:text>
					<xsl:text disable-output-escaping="yes">&lt;</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
					
					<xsl:value-of select="."/>
					
					<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
					<xsl:value-of select="@name"/>
					<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
					<xsl:text>&#xA;</xsl:text>
				</xsl:for-each>
				<xsl:text>&#x9;</xsl:text>
				<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
				<xsl:value-of select="@name"/>
				<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
				<xsl:text>&#xA;</xsl:text>
			</xsl:for-each>
		</xsl:for-each>
		
		<xsl:text disable-output-escaping="yes">&lt;/</xsl:text>
	<xsl:text>Museu</xsl:text>
	<xsl:text disable-output-escaping="yes">&gt;</xsl:text>
	</xsl:template>
</xsl:stylesheet>

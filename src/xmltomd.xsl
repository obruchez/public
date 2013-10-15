<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="utf-8" indent="yes"/>

	<xsl:template match="books">
		<xsl:text># Books</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>Date | Author | Title | Subtitle | Year | Rating (0-5)</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:text>--- | --- | --- | --- | --- | ---</xsl:text>
		<xsl:text>&#xa;</xsl:text>
		<xsl:for-each select="book">
			<xsl:call-template name="book"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="book">
		<xsl:text>&lt;a name="</xsl:text>
		<xsl:value-of select="1+last()-position()"/>
		<xsl:text>"&gt;&lt;/a&gt;</xsl:text>
		<xsl:value-of select="substring(child::date[1], 1, 4)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(child::date[1], 6, 2)"/>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="substring(child::date[1], 9, 2)"/>
		<xsl:text> | </xsl:text>
		<xsl:value-of select="child::author[1]"/>
		<xsl:text> | </xsl:text>
		<xsl:value-of select="child::title[1]"/>
		<xsl:text> | </xsl:text>
		<xsl:value-of select="child::subtitle[1]"/>
		<xsl:text> | </xsl:text>
		<xsl:value-of select="child::publishingyear[1]"/>
		<xsl:text> | </xsl:text>
	    <xsl:if test="string-length(child::rating[1])>0"><xsl:value-of select="child::rating[1]-1"/></xsl:if>
		<xsl:text>&#xa;</xsl:text>
	</xsl:template>
</xsl:stylesheet>

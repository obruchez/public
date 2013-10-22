<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>

    <xsl:include href="common.xsl"/>
    <xsl:include href="concerts.xsl"/>

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
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::author[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::title[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::subtitle[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::publishingyear[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="concerts">
        <xsl:text># Concerts</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Date | Musicians | Location | Event | Rating (0-5) | Comments</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="concert">
            <xsl:call-template name="concert"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="concert">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>

        <xsl:text> | </xsl:text>
        <xsl:call-template name="musicians"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::location[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::event[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="anchor">
        <xsl:text>&lt;a name="</xsl:text>
        <xsl:value-of select="1+last()-position()"/>
        <xsl:text>"&gt;&lt;/a&gt;</xsl:text>
    </xsl:template>

    <xsl:template name="musicians">
    	<xsl:variable name="musicians-with-html"><xsl:call-template name="musicians-with-html"/></xsl:variable>
    	<xsl:apply-templates select="$musicians-with-html"/>
    </xsl:template>

    <xsl:template match="strong">
  		<xsl:text>**</xsl:text><xsl:value-of select="text()"/><xsl:text>**</xsl:text>
	</xsl:template>
</xsl:stylesheet>

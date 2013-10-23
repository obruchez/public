<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="movie-main-title">
        <xsl:variable name="version" select="child::version[1]"/>
        <xsl:choose>
            <xsl:when test="string-length($version)>0 and count(child::title[@language=$version])>0">
                <xsl:value-of select="child::title[@language=$version]"/>
            </xsl:when>
            <xsl:when test="count(child::title[string-length(@language)=0])>0">
                <xsl:value-of select="child::title[string-length(@language)=0]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="child::title[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>  

    <xsl:template name="movie-title-with-html">
        <xsl:choose>
            <xsl:when test="count(child::title[string-length(@language)=0])>0">
                <xsl:choose>
                    <xsl:when test="count(child::uri[1])>0">
                        <a href="{child::uri[1]}"><xsl:value-of select="child::title[string-length(@language)=0]"/></a>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="child::title[string-length(@language)=0]"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>   
    </xsl:template>  

    <xsl:template name="movie-language-with-html">
       <xsl:for-each select="child::title[string-length(@language)>0]">
            <xsl:choose>
                <xsl:when test="position()!=1"><xsl:text>, </xsl:text></xsl:when>
            </xsl:choose>
            <xsl:value-of select="."/>
            <xsl:choose>
                <xsl:when test="@language='fr'"><xsl:text> (French)</xsl:text></xsl:when>
                <xsl:when test="@language='en'"><xsl:text> (English)</xsl:text></xsl:when>
                <xsl:when test="@language='jp'"><xsl:text> (Japanese)</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text> (</xsl:text><xsl:value-of select="@language"/><xsl:text>)</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>  

    <xsl:template name="movie-version-with-html">
       <xsl:choose>
            <xsl:when test="string-length(child::version[1])=0">Original</xsl:when>
            <xsl:when test="child::version[1]='fr'">French</xsl:when>
            <xsl:when test="child::version[1]='de'">German</xsl:when>
            <xsl:otherwise><xsl:value-of select="child::version[1]"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>  
</xsl:stylesheet>

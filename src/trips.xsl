<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="trip-from">
        <xsl:call-template name="date-with-param">
            <xsl:with-param name="date"><xsl:value-of select="child::from[1]"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>   

    <xsl:template name="trip-to">
        <xsl:call-template name="date-with-param">
            <xsl:with-param name="date"><xsl:value-of select="child::to[1]"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>  

    <xsl:template name="trip-pictures-with-html">
        <xsl:for-each select="child::pictures">
            <xsl:choose>
                <xsl:when test="string-length(.)>0">
                    <a href="{@url}"><xsl:value-of select="."/></a><br/>
                </xsl:when>
                <xsl:otherwise>
                    <a href="{@url}"><xsl:value-of select="parent::*/child::place[1]"/></a><br/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template> 
</xsl:stylesheet>

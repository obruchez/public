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
</xsl:stylesheet>

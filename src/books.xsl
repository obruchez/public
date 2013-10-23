<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="book-title-with-html">
        <xsl:choose>
            <xsl:when test="string-length(child::url[1])>0">
                <a href="{child::url[1]}"><xsl:value-of select="child::title[1]"/></a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="child::title[1]"/>
            </xsl:otherwise>
        </xsl:choose> 
    </xsl:template>  
</xsl:stylesheet>

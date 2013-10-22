<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="musicians-with-html">
        <xsl:if test="string-length(child::group[1])>0">
            <strong><xsl:value-of select="child::group[1]"/></strong>
            <xsl:if test="count(child::musician)>0">: </xsl:if>
        </xsl:if>
        <xsl:for-each select="child::musician">
            <xsl:choose>
                <xsl:when test="(@leader='true' or last()=1) and string-length(parent::*/child::group[1])=0"><strong><xsl:value-of select="."/></strong></xsl:when>
                <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="comma-or-and"/>
        </xsl:for-each>
    </xsl:template>    
</xsl:stylesheet>

<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="date">
        <xsl:call-template name="date-with-param">
            <xsl:with-param name="date"><xsl:value-of select="child::date[1]"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="date-with-param">
        <xsl:param name="date"/>
        <xsl:value-of select="substring($date, 1, 4)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($date, 6, 2)"/>
        <xsl:text>/</xsl:text>
        <xsl:value-of select="substring($date, 9, 2)"/>
    </xsl:template>

    <xsl:template name="rating">
        <xsl:if test="string-length(child::rating[1])>0">
            <xsl:value-of select="child::rating[1]-1"/>
        </xsl:if>
    </xsl:template>

    <xsl:template name="comma-or-and">
        <xsl:choose>
            <xsl:when test="position()=last()-1">
                <xsl:choose>
                    <xsl:when test="last()=2">
                        <xsl:text> and </xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>, and </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="position()!=last()">
                <xsl:text>, </xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>

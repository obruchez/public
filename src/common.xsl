<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:variable name="base-url">https://raw.github.com/obruchez/public/master</xsl:variable>


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

    <xsl:template name="rating-with-html">
        <xsl:if test="string-length(child::rating[1])>0">
            <xsl:variable name="rating" select="number(child::rating[1]) - 1"/>
            <xsl:variable name="rating-int" select="round($rating * 2) * 5"/>
            <xsl:variable name="rating-first-digit" select="floor($rating-int div 10)"/>
            <xsl:variable name="rating-second-digit" select="$rating-int mod 10"/>
            <img>
                <xsl:attribute name="alt"><xsl:value-of select="$rating"/></xsl:attribute>
                <xsl:attribute name="src"><xsl:value-of select="concat($base-url, '/img/stars', $rating-first-digit, '_', $rating-second-digit, '.png')"/></xsl:attribute>
            </img>
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

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

    <xsl:template name="rating-with-html">
        <xsl:if test="string-length(child::rating[1])>0">
            <xsl:variable name="rating" select="number(child::rating[1])-1"/>
            <xsl:call-template name="star"><xsl:with-param name="rating"><xsl:value-of select="$rating"/></xsl:with-param></xsl:call-template>
            <xsl:call-template name="star"><xsl:with-param name="rating"><xsl:value-of select="$rating - 1"/></xsl:with-param></xsl:call-template>
            <xsl:call-template name="star"><xsl:with-param name="rating"><xsl:value-of select="$rating - 2"/></xsl:with-param></xsl:call-template>
            <xsl:call-template name="star"><xsl:with-param name="rating"><xsl:value-of select="$rating - 3"/></xsl:with-param></xsl:call-template>
            <xsl:call-template name="star"><xsl:with-param name="rating"><xsl:value-of select="$rating - 4"/></xsl:with-param></xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xsl:template name="star">
        <xsl:param name="rating"/>
        <xsl:choose>
            <xsl:when test="$rating &lt; 0.50"><xsl:call-template name="star-empty"/></xsl:when>
            <xsl:when test="$rating &lt; 0.75"><xsl:call-template name="star-half"/></xsl:when>
            <xsl:otherwise><xsl:call-template name="star-full"/></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="star-empty"><img src="/img/star_empty.png" alt="Empty star"/></xsl:template>

    <xsl:template name="star-half"><img src="/img/star_half.png" alt="Half star"/></xsl:template>

    <xsl:template name="star-full"><img src="/img/star_fulll.png" alt="Full star"/></xsl:template>

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

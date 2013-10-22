<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="play-actors-with-html">
        <xsl:for-each select="child::actor">
            <xsl:value-of select="."/>
            <xsl:call-template name="comma-or-and"/>
        </xsl:for-each>
    </xsl:template>   
</xsl:stylesheet>

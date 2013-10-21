<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="text" encoding="utf-8" indent="yes"/>

	<xsl:include href="common.xsl"/>

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

		<!--<td valign="top">
			<xsl:if test="string-length(child::group[1])>0">
		        <b><xsl:value-of select="child::group[1]"/></b>
		        <xsl:if test="count(child::musician)>0">: </xsl:if>
		    </xsl:if>
			<xsl:for-each select="child::musician">
				<xsl:choose>
					<xsl:when test="(@leader='true' or last()=1) and string-length(parent::*/child::group[1])=0"><b><xsl:value-of select="."/></b></xsl:when>
					<xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
				</xsl:choose>
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
			</xsl:for-each>
		</td>
		<td valign="top"><xsl:value-of select="child::location[1]"/></td>
		<td valign="top"><xsl:value-of select="child::event[1]"/></td>
		<td valign="top">
		    <xsl:if test="string-length(child::rating[1])>0">
		        <xsl:value-of select="child::rating[1]-1"/>
		    </xsl:if>
		</td>
		<td valign="top"><xsl:value-of select="child::comments[1]"/></td>-->
	</xsl:template>

	<xsl:template name="anchor">
		<xsl:text>&lt;a name="</xsl:text>
		<xsl:value-of select="1+last()-position()"/>
		<xsl:text>"&gt;&lt;/a&gt;</xsl:text>
	</xsl:template>
</xsl:stylesheet>

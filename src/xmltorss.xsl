<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

	<xsl:include href="common.xsl"/>
    <xsl:include href="movies.xsl"/>
    <xsl:include href="trips.xsl"/>

    <xsl:template match="books">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="book">
                    <xsl:call-template name="book"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="book">
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:value-of select="child::author[1]"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="child::title[1]"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="concerts">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="concert">
                    <xsl:call-template name="concert"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="concert">
        <xsl:variable name="locationTokens" select="tokenize(child::location[1],',')"/>
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:choose>
                    <xsl:when test="count(child::group)>0">
                        <xsl:value-of select="child::group[1]"/>
                    </xsl:when>
                    <xsl:when test="count(child::group)=0 and count(child::musician)=1">
                        <xsl:value-of select="child::musician[1]"/>
                    </xsl:when>
                    <xsl:when test="count(child::group)=0 and (count(child::musician[@leader='true'])>0 or count(child::musician[@leader='yes'])>0)">
                        <xsl:for-each select="musician">
                            <xsl:if test="@leader='true' or @leader='yes'">
                                <xsl:value-of select="."/>
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:when test="count(child::event)>0">
                        <xsl:value-of select="child::event[1]"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="count($locationTokens)=1">
                        <xsl:value-of select="normalize-space($locationTokens[1])"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="string-length($locationTokens[count($locationTokens) - 1])=2">
                                <xsl:value-of select="normalize-space($locationTokens[count($locationTokens) - 2])"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="normalize-space($locationTokens[count($locationTokens) - 1])"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="normalize-space($locationTokens[count($locationTokens)])"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="normalize-space($locationTokens[count($locationTokens) - 1])"/>
                                <xsl:text>, </xsl:text>
                                <xsl:value-of select="normalize-space($locationTokens[count($locationTokens)])"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="crashes">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="crash">
                    <xsl:call-template name="crash"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="crash">
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:value-of select="child::manufacturer[1]"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="child::model[1]"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="exhibitions">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="exhibition">
                    <xsl:call-template name="exhibition"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="exhibition">
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:value-of select="child::museum[1]"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="child::name[1]"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="movies">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="movie">
                    <xsl:call-template name="movie"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="movie">
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:choose>
                    <xsl:when test="string-length(child::director[1])>0">
                        <xsl:value-of select="child::director[1]"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>?</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text> - </xsl:text>
                <xsl:call-template name="movie-main-title"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="plays">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="play">
                    <xsl:call-template name="play"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="play">
		<xsl:call-template name="item">
            <xsl:with-param name="contents">
                <xsl:value-of select="child::name[1]"/>
                <xsl:text> - </xsl:text>
                <xsl:value-of select="child::location[1]"/>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="trips">
		<xsl:call-template name="rss">
            <xsl:with-param name="contents">
                <xsl:for-each select="trip">
                    <xsl:call-template name="trip"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="trip">
		<xsl:call-template name="item-with-date">
            <xsl:with-param name="contents">
                <xsl:call-template name="trip-from"/>
                <xsl:text>-</xsl:text>
                <xsl:call-template name="trip-to"/>
                <xsl:text>: </xsl:text>
                <xsl:value-of select="child::place[1]"/>
            </xsl:with-param>
            <xsl:with-param name="date">
                <xsl:call-template name="rss-date-with-param">
                	<xsl:with-param name="date"><xsl:value-of select="child::from[1]"/></xsl:with-param>
            	</xsl:call-template>  
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="rss">
        <xsl:param name="contents"/>
        <rss version="2.0">
            <channel>
                <title><xsl:value-of select="@title"/></title>
                <description><xsl:value-of select="@description"/></description>
                <link><xsl:value-of select="@link"/></link>
                <xsl:copy-of select="$contents"/>
            </channel>
        </rss>
    </xsl:template>

   <xsl:template name="item">
        <xsl:param name="contents"/>
        <xsl:call-template name="item-with-date">
        	<xsl:with-param name="contents"><xsl:copy-of select="$contents"/></xsl:with-param>
            <xsl:with-param name="date"><xsl:call-template name="rss-date"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="item-with-date">
        <xsl:param name="contents"/>
        <xsl:param name="date"/>
        <item>
            <title><xsl:copy-of select="$contents"/></title>
            <pubDate><xsl:copy-of select="$date"/></pubDate>
            <guid><xsl:value-of select="../@link"/>#<xsl:value-of select="1+last()-position()"/></guid>
        </item>
    </xsl:template>

    <xsl:template name="rss-date">
        <xsl:call-template name="rss-date-with-param">
            <xsl:with-param name="date"><xsl:value-of select="child::date[1]"/></xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="rss-date-with-param">
        <xsl:param name="date"/>
        <xsl:value-of select="substring($date, 9, 2)"/>
        <xsl:text> </xsl:text>
        <xsl:if test="substring($date, 6, 2)='01'">
            <xsl:text>Jan</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='02'">
            <xsl:text>Feb</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='03'">
            <xsl:text>Mar</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='04'">
            <xsl:text>Apr</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='05'">
            <xsl:text>May</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='06'">
            <xsl:text>Jun</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='07'">
            <xsl:text>Jul</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='08'">
            <xsl:text>Aug</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='09'">
            <xsl:text>Sep</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='10'">
            <xsl:text>Oct</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='11'">
            <xsl:text>Nov</xsl:text>
        </xsl:if>
        <xsl:if test="substring($date, 6, 2)='12'">
            <xsl:text>Dec</xsl:text>
        </xsl:if>
        <xsl:text> </xsl:text>
        <xsl:value-of select="substring($date, 1, 4)"/>
        <xsl:text> 00:00:00 +0000</xsl:text>
    </xsl:template>
</xsl:stylesheet>

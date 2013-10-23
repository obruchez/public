<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="utf-8" indent="yes"/>

    <xsl:include href="common.xsl"/>
    <xsl:include href="books.xsl"/>
    <xsl:include href="concerts.xsl"/>
    <xsl:include href="movies.xsl"/>
    <xsl:include href="plays.xsl"/>
    <xsl:include href="trips.xsl"/>

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
        <xsl:call-template name="book-title"/>
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
        <xsl:text> | </xsl:text>
        <xsl:call-template name="concert-musicians"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::location[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::event[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="crashes">
        <xsl:text># Crashes</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Date | Manufacturer | Model | Comments</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="crash">
            <xsl:call-template name="crash"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="crash">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::manufacturer[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::model[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="exhibitions">
        <xsl:text># Exhibitions</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Date | Name | Museum | Rating (0-5) | Comments</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="exhibition">
            <xsl:call-template name="exhibition"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="exhibition">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::name[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::museum[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="movies">
        <xsl:text># Movies</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Date | Theater | Director | Title | Alternative Title(s) | Version | Rating (0-5) | Comments</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | --- | --- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="movie">
            <xsl:call-template name="movie"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="movie">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::theater[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::director[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="movie-title"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="movie-language"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="movie-version"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="plays">
        <xsl:text># Plays</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>Date | Location | Name | Author | Director | Adaptation | Translation | Actors | Rating (0-5) | Comments</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | --- | --- | --- | --- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="play">
            <xsl:call-template name="play"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="play">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="date"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::location[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::name[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::author[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::director[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::adaptation[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::translation[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="play-actors"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="rating"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::comments[1]"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="trips">
        <xsl:text># Trips</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>From | To | Place | Pictures</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:text>--- | --- | --- | ---</xsl:text>
        <xsl:text>&#xa;</xsl:text>
        <xsl:for-each select="trip">
            <xsl:call-template name="trip"/>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="trip">
        <xsl:call-template name="anchor"/>
        <xsl:call-template name="trip-from"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="trip-to"/>
        <xsl:text> | </xsl:text>
        <xsl:value-of select="child::place[1]"/>
        <xsl:text> | </xsl:text>
        <xsl:call-template name="trip-pictures"/>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template name="anchor">
        <xsl:text>&lt;a name="</xsl:text>
        <xsl:value-of select="1+last()-position()"/>
        <xsl:text>"&gt;&lt;/a&gt;</xsl:text>
    </xsl:template>

    <xsl:template name="rating">
        <xsl:variable name="rating-with-html"><xsl:call-template name="rating-with-html"/></xsl:variable>
        <xsl:apply-templates select="$rating-with-html"/>
    </xsl:template>

    <xsl:template name="book-title">
        <xsl:variable name="book-title-with-html"><xsl:call-template name="book-title-with-html"/></xsl:variable>
        <xsl:apply-templates select="$book-title-with-html"/>
    </xsl:template>

    <xsl:template name="concert-musicians">
        <xsl:variable name="concert-musicians-with-html"><xsl:call-template name="concert-musicians-with-html"/></xsl:variable>
        <xsl:apply-templates select="$concert-musicians-with-html"/>
    </xsl:template>

    <xsl:template name="movie-title">
        <xsl:variable name="movie-title-with-html"><xsl:call-template name="movie-title-with-html"/></xsl:variable>
        <xsl:apply-templates select="$movie-title-with-html"/>
    </xsl:template>

    <xsl:template name="movie-language">
        <xsl:variable name="movie-language-with-html"><xsl:call-template name="movie-language-with-html"/></xsl:variable>
        <xsl:apply-templates select="$movie-language-with-html"/>
    </xsl:template>

    <xsl:template name="movie-version">
        <xsl:variable name="movie-version-with-html"><xsl:call-template name="movie-version-with-html"/></xsl:variable>
        <xsl:apply-templates select="$movie-version-with-html"/>
    </xsl:template>

    <xsl:template name="play-actors">
        <xsl:variable name="play-actors-with-html"><xsl:call-template name="play-actors-with-html"/></xsl:variable>
        <xsl:apply-templates select="$play-actors-with-html"/>
    </xsl:template>

    <xsl:template name="trip-pictures">
        <xsl:variable name="trip-pictures-with-html"><xsl:call-template name="trip-pictures-with-html"/></xsl:variable>
        <xsl:apply-templates select="$trip-pictures-with-html"/>
    </xsl:template>

    <xsl:template match="a" priority="1">
        <xsl:text>[</xsl:text>
        <xsl:value-of select="text()"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@href"/>
        <xsl:if test="@title">
            <xsl:text> "</xsl:text>
            <xsl:value-of select="@title"/>
            <xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xsl:template match="br">
        <xsl:text>&lt;br/&gt;</xsl:text>
    </xsl:template>

    <xsl:template match="div">
        <xsl:text>&lt;div&gt;</xsl:text><xsl:apply-templates select="* | text()"/><xsl:text>&lt;/div&gt;</xsl:text>
    </xsl:template>

    <xsl:template match="img" priority="1">
        <xsl:text>![</xsl:text>
        <xsl:value-of select="@alt"/>
        <xsl:text>](</xsl:text>
        <xsl:value-of select="@src"/>
        <xsl:if test="@title">
            <xsl:text> "</xsl:text>
            <xsl:value-of select="@title"/>
            <xsl:text>"</xsl:text>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xsl:template match="strong">
          <xsl:text>**</xsl:text><xsl:value-of select="text()"/><xsl:text>**</xsl:text>
    </xsl:template>

    <xsl:template match="ul">
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <xsl:template match="ul/li/text()">
        <xsl:value-of select="normalize-space(.)"/>
    </xsl:template>

    <xsl:template match="ul/li">
        <xsl:text>* </xsl:text>
        <xsl:apply-templates select="* | text()"/>
        <xsl:text>
        </xsl:text>
    </xsl:template>

    <xsl:template match="ul/li/ul/li">
        <xsl:text>
          * </xsl:text>
        <xsl:apply-templates select="* | text()"/>
    </xsl:template>

    <xsl:template match="ul/li/ul/li/ul/li">
        <xsl:text>
              * </xsl:text>
        <xsl:apply-templates select="* | text()"/>
    </xsl:template>
</xsl:stylesheet>

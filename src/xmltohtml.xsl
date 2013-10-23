<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>

    <xsl:include href="common.xsl"/>
    <xsl:include href="books.xsl"/>
    <xsl:include href="concerts.xsl"/>
    <xsl:include href="movies.xsl"/>
    <xsl:include href="plays.xsl"/>
    <xsl:include href="trips.xsl"/>

    <xsl:variable name="color1">d2d2d2</xsl:variable>
    <xsl:variable name="color2">f0f0f0</xsl:variable>

    <xsl:template match="books">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Author</th><th>Title</th><th>Subtitle</th><th>Year</th><th>Rating (0-5)</th></tr>
                <xsl:for-each select="book">
                    <xsl:call-template name="book"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="book">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:value-of select="child::author[1]"/></td>
                <td valign="top"><xsl:call-template name="book-title-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::subtitle[1]"/></td>
                <td valign="top"><xsl:value-of select="child::publishingyear[1]"/></td>
                <td valign="top"><xsl:call-template name="rating-with-html"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="concerts">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Musicians</th><th>Location</th><th>Event</th><th>Rating (0-5)</th><th>Comments</th></tr>
                <xsl:for-each select="concert">
                    <xsl:call-template name="concert"/>
                </xsl:for-each>
              </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="concert">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:call-template name="concert-musicians-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::location[1]"/></td>
                <td valign="top"><xsl:value-of select="child::event[1]"/></td>
                <td valign="top"><xsl:call-template name="rating-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::comments[1]"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="crashes">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Manufacturer</th><th>Model</th><th>Comments</th></tr>
                <xsl:for-each select="crash">
                    <xsl:call-template name="crash"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="crash">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:value-of select="child::manufacturer[1]"/></td>
                <td valign="top"><xsl:value-of select="child::model[1]"/></td>
                <td valign="top"><xsl:value-of select="child::comments[1]"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>
    
    <xsl:template match="exhibitions">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Name</th><th>Museum</th><th>Rating (0-5)</th><th>Comments</th></tr>
                <xsl:for-each select="exhibition">
                    <xsl:call-template name="exhibition"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="exhibition">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:value-of select="child::name[1]"/></td>
                <td valign="top"><xsl:value-of select="child::museum[1]"/></td>
                <td valign="top"><xsl:call-template name="rating-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::comments[1]"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="movies">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Theater</th><th>Director</th><th width="25%">Title</th><th>Alternative Title(s)</th><th>Version</th><th>Rating (0-5)</th><th width="25%">Comments</th></tr>
                <xsl:for-each select="movie">
                    <xsl:call-template name="movie"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="movie">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:value-of select="child::theater[1]"/></td>
                <td valign="top"><xsl:value-of select="child::director[1]"/></td>
                <td valign="top"><xsl:call-template name="movie-title-with-html"/></td>
                <td valign="top"><xsl:call-template name="movie-language-with-html"/></td>
                <td valign="top"><xsl:call-template name="movie-version-with-html"/></td>
                <td valign="top"><xsl:call-template name="rating-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::comments[1]"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="plays">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>Date</th><th>Location</th><th>Name</th><th>Author</th><th>Director</th><th>Adaptation</th><th>Translation</th><th>Actors</th><th>Rating (0-5)</th><th>Comments</th></tr>
                <xsl:for-each select="play">
                    <xsl:call-template name="play"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="play">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="date"/></td>
                <td valign="top"><xsl:value-of select="child::location[1]"/></td>
                <td valign="top"><xsl:value-of select="child::name[1]"/></td>
                <td valign="top"><xsl:value-of select="child::author[1]"/></td>
                <td valign="top"><xsl:value-of select="child::director[1]"/></td>
                <td valign="top"><xsl:value-of select="child::adaptation[1]"/></td>
                <td valign="top"><xsl:value-of select="child::translation[1]"/></td>
                <td valign="top"><xsl:call-template name="play-actors-with-html"/></td>
                <td valign="top"><xsl:call-template name="rating-with-html"/></td>
                <td valign="top"><xsl:value-of select="child::comments[1]"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="trips">
        <xsl:call-template name="table">
            <xsl:with-param name="contents">
                <tr bgcolor="#{$color1}"><th>From</th><th>To</th><th>Place</th><th>Pictures</th></tr>
                <xsl:for-each select="trip">
                    <xsl:call-template name="trip"/>
                </xsl:for-each>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="trip">
        <xsl:call-template name="row">
            <xsl:with-param name="contents">
                <td valign="top"><xsl:call-template name="trip-from"/></td>
                <td valign="top"><xsl:call-template name="trip-to"/></td>
                <td valign="top"><xsl:value-of select="child::place[1]"/></td>
                <td valign="top"><xsl:call-template name="trip-pictures-with-html"/></td>
            </xsl:with-param>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="table">
        <xsl:param name="contents"/>
        <html>
            <head>
                <title><xsl:value-of select="@title"/></title>
                <link rel="alternate" type="application/rss+xml" title="{@title} Feed" href="{@feed}"/>
            </head>
            <body>
                <table border="0">
                    <xsl:copy-of select="$contents"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="row">
        <xsl:param name="contents"/>
        <xsl:variable name="color">
            <xsl:choose>
                <xsl:when test="position() mod 2 = 0"><xsl:value-of select="$color1"/></xsl:when>
                <xsl:otherwise><xsl:value-of select="$color2"/></xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
         <tr bgcolor="#{$color}">
            <a name="{1+last()-position()}">
                <xsl:copy-of select="$contents"/>
            </a>
        </tr>
    </xsl:template>
</xsl:stylesheet>

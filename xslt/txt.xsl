<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/filmLibrary">
        <xsl:for-each select="film">
            <xsl:value-of select="title"/>
            <xsl:text> - </xsl:text>
            <xsl:value-of select="genre"/>
            <xsl:text> (</xsl:text>
            <xsl:value-of select="date"/>
            <xsl:text>)</xsl:text>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Genres: </xsl:text>
            <xsl:for-each select="genre">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Producer(s): </xsl:text>
            <xsl:for-each select="producer">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Composer(s): </xsl:text>
            <xsl:for-each select="composer">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Actor(s): </xsl:text>
            <xsl:for-each select="actor">
                <xsl:value-of select="."/>
                <xsl:text>, </xsl:text>
            </xsl:for-each>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Gross: </xsl:text>
            <xsl:value-of select="gross"/>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Certification: </xsl:text>
            <xsl:value-of select="cert"/>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Views: </xsl:text>
            <xsl:value-of select="views"/>
            <xsl:text>&#10;</xsl:text>

            <xsl:text>Language: </xsl:text>
            <xsl:value-of select="lang"/>
            <xsl:text>&#10;&#10;</xsl:text>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>

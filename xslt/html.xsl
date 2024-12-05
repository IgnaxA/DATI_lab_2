<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Стиль для таблицы -->
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>Film Library</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        margin: 20px;
                    }
                    table {
                        width: 100%;
                        border-collapse: collapse;
                        margin-top: 20px;
                    }
                    th, td {
                        border: 1px solid #ddd;
                        padding: 8px;
                        text-align: left;
                    }
                    th {
                        background-color: #B0E0E6;
                    }
                    tr:nth-child(even) {
                        background-color: #87CEFA;
                    }
                </style>
            </head>
            <body>
                <h1>Film Library</h1>
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Genres</th>
                        <th>Producers</th>
                        <th>Composers</th>
                        <th>Actors</th>
                        <th>Release Date</th>
                        <th>Gross</th>
                        <th>Certification</th>
                        <th>Views</th>
                        <th>Language</th>
                    </tr>
                    <xsl:for-each select="filmLibrary/film">
                        <tr>
                            <td><xsl:value-of select="title"/></td>
                            <td>
                                <xsl:for-each select="genre">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="producer">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="composer">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>
                            </td>
                            <td>
                                <xsl:for-each select="actor">
                                    <xsl:value-of select="."/>
                                    <xsl:text>, </xsl:text>
                                </xsl:for-each>
                            </td>
                            <td><xsl:value-of select="date"/></td>
                            <td><xsl:value-of select="gross"/></td>
                            <td><xsl:value-of select="cert"/></td>
                            <td><xsl:value-of select="views"/></td>
                            <td><xsl:value-of select="lang"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

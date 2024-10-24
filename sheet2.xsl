<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output encoding="utf-8" method="text" indent="no" omit-xml-declaration="yes" xml:space="default"/>

    <xsl:template match="/">
        <xsl:apply-templates select="Data/Measurement" />
    </xsl:template>

    <xsl:template match="Data/Measurement">
        <xsl:apply-templates select="x"/><xsl:text>|</xsl:text>
        <xsl:apply-templates select="y"/><xsl:text>|</xsl:text>
        <xsl:apply-templates select="z"/><xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="x|y|z">
        <xsl:apply-templates select="*"/>
    </xsl:template>

    <xsl:template match="*">
        <xsl:apply-templates select="text()"/>
        <xsl:if test="not(position() = last())">
            <xsl:text>;</xsl:text>
        </xsl:if>
    </xsl:template>

</xsl:stylesheet>
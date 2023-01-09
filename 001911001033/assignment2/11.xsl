<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html>
            <body>
            <h1> Question Paper </h1>
                <xsl:for-each select = "question-paper/question">
                    <h3>Question #<xsl:value-of select="@no"/></h3>
                    <h3><xsl:value-of select="text"/></h3>
                    <h4>OptionA: <xsl:value-of select="optionA"/></h4>
                    <h4>OptionB: <xsl:value-of select="optionB"/></h4>
                    <h4>OptionC: <xsl:value-of select="optionC"/></h4>
                    <h4>OptionD: <xsl:value-of select="optionD"/></h4>
                    <h4>Answer: <xsl:value-of select="answer"/></h4>
                    <hr></hr>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
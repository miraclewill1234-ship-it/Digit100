<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="text()">
        <xsl:analyze-string select="." 
            regex="^([A-Z][A-Z ]+):" 
            flags="m">
            
            <xsl:matching-substring>
                <speaker>
                    <spk > <xsl:value-of select="regex-group(1)"/></spk>
                </speaker>
            </xsl:matching-substring>
            
            <xsl:non-matching-substring>
                <xsl:value-of select="."/>
            </xsl:non-matching-substring>
            
        </xsl:analyze-string>
        
    </xsl:template>  
</xsl:stylesheet>
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
        version="3.0">
        
        <!-- Output port for the pipeline -->
        <p:output port="result"/>
        
        <!-- 1. Load Zoom transcript XML -->
        <p:load name="load-transcript">
            <p:with-option name="href" select="'zoom-transcript.xml'"/>
        </p:load>
        
        <!-- 2. Transform XML inline -->
        <p:xslt name="compute-and-sort-inline">
            <p:input port="source">
                <p:pipe step="load-transcript"/>
            </p:input>
            
            <!-- Inline XSLT starts here -->
            <xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
                <xsl:output method="xml" indent="yes"/>
                
                <!-- Compute total words in transcript -->
                <xsl:variable name="totalTokens"
                    select="sum(for $s in transcript/speech return count(tokenize($s/text, '\s+')))"/>
                
                <xsl:template match="/transcript">
                    <transcript-with-fractions>
                        <!-- Sort speeches by word count descending -->
                        <xsl:for-each select="speech">
                            <xsl:sort select="count(tokenize(text, '\s+'))" data-type="number" order="descending"/>
                            <speech>
                                <id><xsl:value-of select="id"/></id>
                                <start><xsl:value-of select="start"/></start>
                                <end><xsl:value-of select="end"/></end>
                                <text><xsl:value-of select="text"/></text>
                                <wordCount><xsl:value-of select="count(tokenize(text, '\s+'))"/></wordCount>
                                <fraction>
                                    <xsl:value-of select="count(tokenize(text, '\s+')) div $totalTokens"/>
                                </fraction>
                            </speech>
                        </xsl:for-each>
                    </transcript-with-fractions>
                </xsl:template>
                
            </xsl:stylesheet>
            <!-- Inline XSLT ends here -->
        </p:xslt>
        
        <!-- 3. Store the transformed XML -->
        <p:store name="store-result">
            <p:input port="source">
                <p:pipe step="compute-and-sort-inline"/>
            </p:input>
            <p:with-option name="href" select="'zoom-transcript-processed.xml'"/>
        </p:store>
        
    </p:declare-step>  
</xsl:stylesheet>
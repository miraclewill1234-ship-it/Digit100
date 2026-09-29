<?xml version="1.0" encoding="UTF-8"?>
<p:declare-step xmlns:p="http://www.w3.org/ns/xproc"
    version="3.0">
    
    <p:output port="result"/>
    
    <p:load name="load-transcript">
        <p:with-option name="href" select="'zoom-transcript.xml'"/>
    </p:load>
    
    
    <p:xslt name="compute-and-sort">
        
        <p:with-option name="href" select="'compute-and-sort.xsl'"/>
    </p:xslt>
    
    <p:store name="store-result">
        <p:with-option name="href" select="'zoom-transcript-processed.xml'"/>
    </p:store>
    
</p:declare-step>
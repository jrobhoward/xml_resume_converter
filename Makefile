resume.pdf: template.xsl resume.xml
	fop -c ./fop.xconf -v -xml resume.xml -xsl template.xsl  -pdf resume.pdf
fontlist:
	java -classpath /usr/share/java/commons-io.jar:/usr/share/java/avalon-framework.jar:/usr/share/java/serializer.jar:/usr/share/java/xalan2.jar:/usr/share/java/xml-apis.jar:/usr/share/java/batik-all.jar:/usr/share/java/commons-logging.jar:/usr/share/java/xercesImpl.jar:/usr/share/java/xmlgraphics-commons.jar:/usr/share/java/xml-apis-ext.jar:/usr/share/fop/fop-hyph.jar:/usr/share/java/fop.jar -Djava.awt.headless=true -Dorg.apache.commons.logging.Log=org.apache.fop.util.CommandLineLogger org.apache.fop.tools.fontlist.FontListMain -c ./fop.xconf
clean:
	rm resume.pdf

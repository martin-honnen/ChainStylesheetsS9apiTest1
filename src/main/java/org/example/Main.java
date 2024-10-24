package org.example;

import net.sf.saxon.s9api.*;

import javax.xml.transform.stream.StreamSource;
import java.io.File;

//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) throws SaxonApiException {
        Processor processor = new Processor(false);

        XsltCompiler compiler = processor.newXsltCompiler();

        XsltExecutable xsltExecutable1 = compiler.compile(new File("sheet1.xsl"));
        XsltExecutable xsltExecutable2 = compiler.compile(new File("sheet2.xsl"));

        Xslt30Transformer transformer1 = xsltExecutable1.load30();
        Xslt30Transformer transformer2 = xsltExecutable2.load30();

        transformer1.applyTemplates(new StreamSource("input1.xml"), transformer2.asDocumentDestination(transformer2.newSerializer(System.out)));

    }
}
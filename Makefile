

index.html : source/book.adoc source
	asciidoctor -b html5 -d book -o $@ $<

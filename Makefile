.RECIPEPREFIX = >

# The operator ‘!=’ is not negation; it executes a shell script and sets a variable to its output.
STATIC_ADOC_FILES != find source -name '*.adoc'
GENERATED_ADOC_FILES != find source -name '*.adoc0' | sed 's/\.adoc0/.adoc/'
ADOC_FILES = $(STATIC_ADOC_FILES) $(GENERATED_ADOC_FILES)

MAIN_ADOC_FILE = source/book.adoc

.PHONY: debug
debug :
> @echo "STATIC_ADOC_FILES=$(STATIC_ADOC_FILES)"
> @echo "GENERATED_ADOC_FILES=$(GENERATED_ADOC_FILES)"
> @echo "ADOC_FILES=$(ADOC_FILES)"

.PHONY: html
html : index.html

%.adoc : %.adoc0
> run-code-inline < $< 2>&1 | tee $@

index.html : source/book.adoc $(ADOC_FILES)
> asciidoctor -b html5 -d book -o $(MAIN_ADOC_FILE) $<

.PHONY: clean
clean :
> echo removing $(GENERATED_ADOC_FILES)

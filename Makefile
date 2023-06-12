# Tab characters are invisible evil. Use a different prefix in recipes.
.RECIPEPREFIX = >

# The operator ‘!=’ is not negation; it executes a shell script and sets a variable to its output.
STATIC_ADOC_FILES != find source -name '*.adoc'
GENERATED_ADOC_FILES != find source -name '*.adoc0' | sed 's/\.adoc0/-generated.adoc/'
ADOC_FILES = $(STATIC_ADOC_FILES) $(GENERATED_ADOC_FILES)

MAIN_ADOC_FILE = source/book.adoc

.PHONY: debug
debug :
> @echo "STATIC_ADOC_FILES=$(STATIC_ADOC_FILES)"
> @echo "GENERATED_ADOC_FILES=$(GENERATED_ADOC_FILES)"
> @echo "ADOC_FILES=$(ADOC_FILES)"

.PHONY: html
html : index.html

# Files with the "adoc0" extension contain code that must be executed and included in order to generate asciidoc files.
# My "run-code-inline" script is available at https://github.com/mhwombat/bin/blob/master/run-code-inline.
# We want to treat any paths in commands as relative to the adoc0 file, so we cd to its directory.
# The "dir" and "notdir" functions extract the directory and base filename from a path, respectively.
%-generated.adoc : %.adoc0
> cd $(dir $@); run-code-inline < $(notdir $<) 2>&1 | tee $(notdir $@)

index.html : $(ADOC_FILES)
> asciidoctor -b html5 -d book -o $@ $(MAIN_ADOC_FILE)

.PHONY: clean
clean :
> rm -rf $(GENERATED_ADOC_FILES) hello-python

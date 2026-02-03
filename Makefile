NAME=draft-ietf-sidrops-constraining-rpki-trust-anchors
LAST_UPLOADED=00

.PHONY: all
all: drafts

.PHONY: drafts
drafts: $(NAME).txt

$(NAME).txt: $(NAME).xml
	xml2rfc $(NAME).xml --html --text --expand --allow-local-file-access

clean:
	rm -f *.html *.txt *.exp.xml

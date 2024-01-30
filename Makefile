NAME=draft-snijders-constraining-rpki-trust-anchors
LAST_UPLOADED=02

.PHONY: all
all: drafts diff

.PHONY: drafts
drafts: $(NAME).txt

$(NAME).txt: $(NAME).xml
	xml2rfc $(NAME).xml --html --text --expand

clean:
	rm -f *.html *.txt *.exp.xml

install:
	doas cp {afrinic,apnic,arin,lacnic,ripe}.constraints /etc/rpki/

diff:
	rfcdiff $(NAME)-$(LAST_UPLOADED).txt $(NAME).txt

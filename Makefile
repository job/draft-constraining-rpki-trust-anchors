NAME=draft-snijders-constraining-rpki-trust-anchors

.PHONY: all
all: drafts

.PHONY: drafts
drafts: $(NAME).txt

$(NAME).txt: $(NAME).xml
	xml2rfc $(NAME).xml --html --text --expand

clean:
	rm -f *.html *.txt *.exp.xml

install:
	doas cp arin.constraints /etc/rpki/
	doas cp afrinic.constraints /etc/rpki/
	doas cp ripe.constraints /etc/rpki/apnic.constraints
	doas cp ripe.constraints /etc/rpki/lacnic.constraints
	doas cp ripe.constraints /etc/rpki/ripe.constraints

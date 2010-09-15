
PDF_FLAGS = --fontsize 9.0 \
			--linkstyle plain \
			--linkcolor green \
			--embedfonts \
			--footer "c 1" \
			--no-toc

MD = pages/index.md \
	 chapters/chapter1.md \

HTML = $(MD:.md=.html)

all: book.html book.pdf

regenerate: clean all
	git commit -a -m 'Regenerated book' && echo done

book.pdf: $(HTML)
	@echo "\n... generating $@"
	htmldoc $(HTML) $(PDF_FLAGS) --outfile $@

book.html: pages/head.html pages/tail.html $(HTML)
	@echo "\n... generating $@"
	cat pages/head.html $(HTML) pages/tail.html > book.html

%.html: %.md
	ronn --pipe --fragment $< \
		| sed -E 's/<h1>([^ ]+) - /<h1>/' \
		> $@

view: book.pdf
	open book.pdf

clean:
	rm -f book.*
	rm -f chapters/*.html

.PHONY: view clean regenerate
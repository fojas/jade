
LIB_PREFIX = ~/.node_libraries
PREFIX = /usr/local
TESTS = test/*.js

install:
	cp -f bin/jade $(PREFIX)/bin/jade
	cp -rf lib/jade $(LIB_PREFIX)/.

uninstall:
	rm -f $(PREFIX)/bin/jade
	rm -Rf $(LIB_PREFIX)/jade

test:
	@./support/expresso/bin/expresso \
		-I lib \
		-I support/markdown/lib \
		-I support/sass/lib \
		$(TESTS)

api.html: lib/jade.js
	@dox \
		--private \
		--title "Jade" \
		--desc "Jade is a high performance template engine for [node](http://nodejs.org), inspired by [haml](http://haml-lang.com/), created by [TJ Holowaychuk](http://github.com/visionmedia)." \
		 $< > $@

benchmark:
	@node benchmarks/jade.js && \
	 node benchmarks/haml.js && \
	 node benchmarks/haml2.js && \
	 node benchmarks/ejs.js

.PHONY: install uninstall test example benchmark

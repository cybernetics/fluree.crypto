.PHONY: cljtest cljstest test jar clean

target/fluree-crypto.jar: deps.edn pom.xml src/deps.cljs src/**/*
	clojure -A:jar

jar: target/fluree-crypto.jar

pom.xml: deps.edn
	clojure -Spom

cljtest:
	clojure -A:cljtest

cljstest:
	clojure -A:cljstest

test: cljtest cljstest

src/deps.cljs: package.json
	clojure -A:js-deps

install: target/fluree-crypto.jar
	clojure -A:install

deploy: target/fluree-crypto.jar
	clojure -A:deploy

clean:
	rm -rf target
	rm -rf out
	rm -rf cljs-test-runner-out

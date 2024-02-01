install:
	make install-typescript &&\
		make install-rust &&\
		make install-graphql

install-package:
	sudo npm i -g $(package)

install-typescript:
	make install-package package="tsc"

install-graphql:
	make install-package package="graphql-language-service-cli"

install-rust:
	rustup component add rust-src

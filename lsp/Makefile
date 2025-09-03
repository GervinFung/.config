# https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers
install:
	make json
	make ts
	make svelete
	make elm
	make gql

i:
	sudo npm i -g $(package)

json:
	make i package="vscode-langservers-extracted"

ts:
	make i package="typescript typescript-language-server"

svelete:
	make i package="svelte-language-server"

astro:
	make i package="@astrojs/language-server"

elm:
	make i package="elm elm-test elm-format @elm-tooling/elm-language-server"

gql:
	make i package="graphql-language-service-cli"

tailwindcss:
	make i package="@tailwindcss/language-server"

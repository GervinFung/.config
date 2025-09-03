# https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers
install:
	make json
	make ts
	make svelte
	make elm
	make astro
	make gql
	make tailwindcss
	make vue
	make rust

i:
	sudo npm i -g $(package)

json:
	make i package="vscode-langservers-extracted"

ts:
	make i package="typescript typescript-language-server"

svelte:
	make i package="svelte-language-server"

elm:
	make i package="elm elm-test elm-format @elm-tooling/elm-language-server"

astro:
	make i package="@astrojs/language-server"

gql:
	make i package="graphql-language-service-cli"

tailwindcss:
	make i package="@tailwindcss/language-server"

vue:
	make i package="@vue/language-server"

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

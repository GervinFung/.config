# https://github.com/helix-editor/helix/wiki/How-to-install-the-default-language-servers
install:
	make ts
	make svelte
	make elm
	make gql
	make vue
	make rust

i:
	sudo npm i -g $(package)

ts:
	make i package="typescript typescript-language-server"

svelte:
	make i package="svelte-language-server"

astro:
	make i package="@astrojs/language-server"

elm:
	make i package="elm elm-test elm-format @elm-tooling/elm-language-server"

gql:
	make i package="graphql-language-service-cli"

tailwindcss:
	make i package="@tailwindcss/language-server"

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

vue:
	make i package="@vue/language-server"

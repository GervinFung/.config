install:
	make sql
	make prettier

i:
	sudo npm i -g $(package)

sql:
	make i package="sql-formatter@4.0.2"

prettier:
	make i package="@fsouza/prettierd"

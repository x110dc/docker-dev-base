all:
	docker build -t x110dc/dev-base .
run:
	docker run -i -t x110dc/dev-base bash

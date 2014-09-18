all:
	docker build -t dev .
run:
	docker run --interactive --tty --rm --hostname=dev dev

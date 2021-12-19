IMAGE_NAME="aoc2021"

build:
	docker build -t $(IMAGE_NAME) .

run: build
	docker run -i $(IMAGE_NAME)

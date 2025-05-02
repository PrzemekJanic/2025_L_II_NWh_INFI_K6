.PHONY: deps lint test run

deps:
	pip install -r requirements.txt
	pip install -r test_requirements.txt

lint:
	flake8 hello_world test


run:
	python main.py
	
test:
	PYTHONPATH=. pytest -v -s

docker_build:
		docker build -t hello_world-printer
docker_run: docker_build
		docker run \
 		--name hello-world-printer-dev \
 		-p 5000:5000 \
 		-d hello-world-printer
TAG=$(USERNAME)/hello-world-printer-k62025
 docker_push: docker_build
 	@docker login --username $(USERNAME) --password $${DOCKER_PASSWORD}; \
 	docker tag hello-world-printer $(TAG); \
 	docker push $(TAG); \
 	docker logout;
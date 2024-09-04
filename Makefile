# Makefile for Rasa Chatbot Docker commands

# Build the Docker image
build:
	docker compose build

# Start the Rasa server
start:
	docker compose up -d

# Stop the Rasa server
stop:
	docker compose down

# Restart the Rasa server
restart:
	docker compose restart

# View logs
logs:
	docker compose logs -f

# Train the Rasa model
train:
	docker compose run --rm rasa train

# Run Rasa shell for interactive testing
shell:
	docker compose run --rm rasa shell

# Run Rasa interactive learning
interactive:
	docker compose run --rm rasa interactive

# Run tests
test:
	docker compose run --rm rasa test

# Clean up Docker resources
clean:
	docker compose down -v --rmi all --remove-orphans

.PHONY: build start stop restart logs train shell interactive test clean

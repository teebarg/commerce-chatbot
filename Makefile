# Makefile for Rasa Chatbot Docker commands
GCP_PROJECT_ID := "sigma-chemist-435211-m4"
SLUG := "tbo-chatbot"
DOCKER_HUB := beafdocker
# Colors
YELLOW = $(shell tput -Txterm setaf 3)
RESET = $(shell tput -Txterm sgr0)
RED = $(shell tput -Txterm setaf 1)
GREEN = $(shell tput -Txterm setaf 2)
GCP_REGION := "us-central1"

# Build the Docker image
build:
	@echo "$(YELLOW)Building project image...$(RESET)"
	docker build -t $(SLUG) .

stage:
	@echo "$(YELLOW)Staging for deployment...$(RESET)"
	docker tag $(SLUG):latest $(DOCKER_HUB)/$(SLUG):latest
	docker push $(DOCKER_HUB)/$(SLUG):latest

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


# Deploy to Google Cloud Run
deploy-gcp:
	@echo "$(YELLOW)Deploying to GCP...$(RESET)"
	@if [ -z "$(GCP_PROJECT_ID)" ]; then \
		echo "$(RED)Error: GCP_PROJECT_ID is not set. Please set it in your environment.$(RESET)"; \
		exit 1; \
	fi
	@gcloud run deploy $(SLUG) \
		--image $(DOCKER_HUB)/$(SLUG):latest \
		--platform managed \
		--region us-central1 \
		--allow-unauthenticated \
		--port 5005 \
		--project=$(GCP_PROJECT_ID)
	@echo "$(GREEN)Deployment completed. Please check the Google Cloud Console for details.$(RESET)"
	@echo "$(YELLOW)If deployment fails, check container logs for more information:$(RESET)"
	@echo "gcloud run logs read --service=$(SLUG) --project=$(GCP_PROJECT_ID)"

gcp-logs:
	gcloud run logs read --service=$(SLUG) --project=$(GCP_PROJECT_ID)


.PHONY: build stage start stop restart logs train shell interactive test clean deploy-gcp gcp-logs

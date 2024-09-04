# Rasa E-commerce Store AI Chatbot

This project implements an AI-powered chatbot for an e-commerce store using Rasa, an open-source machine learning framework for automated text and voice-based conversations.

## Features

- Handles common e-commerce queries (product info, shipping, returns, etc.)
- Provides personalized customer support
- Easy to extend with new intents and responses
- Dockerized for easy deployment and scaling

## Prerequisites

- Docker
- Docker Compose

## Quick Start

1. Clone the repository:
   ```
   git clone https://github.com/teebarg/commerce-chatbot
   cd commerce-chatbot
   ```

2. Build the Docker image:
   ```
   make build
   ```

3. Start the Rasa server:
   ```
   make start
   ```

4. The chatbot is now running and accessible at `http://localhost:5005`

## Development

- To train the model: `make train`
- To run interactive learning: `make interactive`
- To run tests: `make test`
- To view logs: `make logs`

## Project Structure

- `data/`: Contains training data (NLU, stories, rules)
- `actions/`: Custom action code
- `config.yml`: Model configuration
- `domain.yml`: Domain definition (intents, entities, slots, actions)
- `endpoints.yml`: Endpoints configuration
- `Dockerfile`: Docker configuration for the Rasa environment
- `docker-compose.yml`: Defines services, networks, and volumes
- `Makefile`: Shortcuts for common Docker and Rasa commands

## Customization

To add new intents or responses:
1. Add examples to `data/nlu.yml`
2. Define the intent in `domain.yml`
3. Add a response in `domain.yml`
4. Create a story in `data/stories.yml`
5. Retrain the model: `make train`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

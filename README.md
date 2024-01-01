## Get Started

### Prerequisites

1. Make sure that [Python](https://www.python.org/downloads/) 3.10 or above installed on your machine.
2. Download and Install [Pip](https://pip.pypa.io/en/stable/installation/) to manage project packages.
3. Create an [OpenAI](https://openai.com/) account and generate a new API Key: To access the OpenAI API, you will need to create an API Key. You can do this by logging into the [OpenAI website](https://openai.com/product) and navigating to the API Key management page.

### Step 1: Clone the repository

This is done with the `git clone` command followed by the URL of the repository:

```bash
git clone https://github.com/ujjwall-R/CMDbuddy
```

Next, navigate to the repository:

```bash
cd CMDbuddy
```

### Step 2: Set environment variables

Create an .env file in the root directory and add the following environment variables, adjusting their values according to your specific requirements and setup.

For example:

```bash
APP_VARIANT=contextful
PATHWAY_REST_CONNECTOR_HOST=0.0.0.0
PATHWAY_REST_CONNECTOR_PORT=8080
OPENAI_API_KEY=<Your Token>
PATHWAY_CACHE_DIR=/tmp/cache
```

### Step 3: Build and deploy custom API [You can test by deploying it locally on port 8080]

You can install and run the LLM App.

- **Install poetry:**

  ```bash
  pip install poetry
  ```

- **Install llm_app and dependencies:**

  ```bash
  poetry install --with examples --extras local
  pip install poetry
  ```

  You can omit `--extras local` part if you're not going to run local example.

- **Run the examples:** You can start the example with the command:

  ```bash
  poetry run ./run_examples.py contextful
  ```

### Step 4: Start to use it

1. **Send REST queries** (in a separate terminal window): These are examples of how to interact with the application once it's running. `curl` is a command-line tool used to send data using various network protocols. Here, it's being used to send HTTP requests to the application.

   ```bash
   curl --data '{"user": "user", "query": "How to connect to Kafka in Pathway?"}' http://localhost:8080/

   curl --data '{"user": "user", "query": "How to use LLMs in Pathway?"}' http://localhost:8080/
   ```

   If you are on windows CMD, then the query would rather look like this

   ```cmd
   curl --data "{\"user\": \"user\", \"query\": \"How to use LLMs in Pathway?\"}" http://localhost:8080/
   ```

2. **Test reactivity by adding a new file:** This shows how to test the application's ability to react to changes in data by adding a new file and sending a query.

   ```bash
   cp ./data/documents_extra.jsonl ./data/pathway-docs/
   ```

   Or if using docker compose:

   ```bash
   docker compose exec llm-app-examples mv /app/examples/data/documents_extra.jsonl /app/examples/data/pathway-docs/
   ```

   Let's query again:

   ```bash
   curl --data '{"user": "user", "query": "How to use LLMs in Pathway?"}' http://localhost:8080/
   ```

### Step 5: Launch the User Interface:

Go to the `examples/ui/` directory (or `examples/pipelines/unstructured/ui` if you are running the unstructured version.) and execute `streamlit run server.py`. Then, access the URL displayed in the terminal to engage with the LLM App using a chat interface.

### Bonus: Build your own Pathway-powered LLM App

Want to learn more about building your own app? See step-by-step guide [Building a llm-app tutorial](https://pathway.com/developers/showcases/llm-app-pathway)

Or,

Simply add `llm-app` to your project's dependencies and copy one of the [examples](#examples) to get started!

## Showcases

- [Python sales](https://github.com/pathway-labs/chatgpt-api-python-sales) - Find real-time sales with AI-powered Python API using ChatGPT and LLM (Large Language Model) App.

- [Dropbox Data Observability](https://github.com/pathway-labs/dropbox-ai-chat) - See how to get started with chatting with your Dropbox and having data observability.

## Troubleshooting

Please check out our [Q&A](https://github.com/pathwaycom/llm-app/discussions/categories/q-a) to get solutions for common installation problems and other issues.

### Raise an issue

To provide feedback or report a bug, please [raise an issue on our issue tracker](https://github.com/pathwaycom/llm-app/issues).

## Contributing

Anyone who wishes to contribute to this project, whether documentation, features, bug fixes, code cleanup, testing, or code reviews, is very much encouraged to do so.

To join, just raise your hand on the [Pathway Discord server](https://discord.com/invite/pathway) (#get-help) or the GitHub [discussion](https://github.com/pathwaycom/llm-app/discussions) board.

If you are unfamiliar with how to contribute to GitHub projects, here is a [Get Started Guide](https://docs.github.com/en/get-started/quickstart/contributing-to-projects). A full set of contribution guidelines, along with templates, are in progress.

## Coming Soon

- Templates for retrieving context via graph walks.
- Easy setup for model drift monitoring.
- Templates for model A/B testing.
- Real-time OpenAI API observability.

## Need help?

Interested in using LLM App with your data source, stack, and custom use cases? Connect with us to get help with:

- Connecting your own live data sources to your LLM application (e.g. Google or Microsoft Drive documents, Kafka, databases, API's, ...).
- Explore how you can get your LLM application up and running in popular cloud platforms such as Azure and AWS.
- End-to-end solution implementation.

Reach us at contact@pathway.com or via <a href="https://pathway.com/solutions/llm-app">Pathway's website</a>.

## Supported and maintained by

<p align="center">
  <a href="https://github.com/pathwaycom/"><img src="https://pathway.com/logo-light.svg" alt="Pathway"/></a>
</p>
<p align="center">
  <a href="https://pathway.com/solutions/llm-app">
    <img src="https://img.shields.io/badge/See%20Pathway's%20offering%20for%20AI%20applications-0000FF" alt="See Pathway's offering for AI applications"/>
  </a>
</p>

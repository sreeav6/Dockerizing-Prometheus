# Dockerizing-Prometheus
In this tutorial we will learn how to dockerize prometheus

# Dockerfile Usage

We will use ubuntu latest as base image
We will use Arg as an argument to avoid installation prompts
We will install required packages
We will also clean the packages to save space
We will download and extract prometheus 2.53.1
Move Prometheus to /usr/local/prometheus and remove the tar.gz file.
Copy prometheus.yml to the container and expose Prometheus on port 9090.
Set the command to start Prometheus with the given configuration file.

# Prometheus yaml file usage

We are scraping metrics for every 15s under global section which means prometheus will collect target metrics every 15s.
Under scrape_configs prometheus will scrape metrics from localhost:9090, it means prometheus is scraping on it's own.
In order to scrape different services you can another job_name and target URLs under the scrape_configs.

# Build Docker Image

```bash
    sudo docker build -t prometheus:1.0.0 .
```
# Verify the docker image

```bash
    sudo docker images
```

# Run the image to create a container

```bash
    sudo docker run -p 9090:9090 prometheus:1.0.0
```

# Access Prometheus 

After running the above command, access Prometheus UI in the browser using the URL localhost:9090, you can see the following	  
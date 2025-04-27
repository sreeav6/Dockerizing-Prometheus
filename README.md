# Dockerizing Prometheus

This tutorial explains how to dockerize Prometheus, a powerful monitoring and alerting toolkit.

---

## Dockerfile Overview

The `Dockerfile` is designed to:
1. Use the latest Ubuntu image as the base.
2. Avoid interactive prompts during package installation using the `ARG DEBIAN_FRONTEND=noninteractive`.
3. Install required packages like `wget` and `curl`.
4. Clean up unnecessary files to save space.
5. Download and extract Prometheus version `2.53.1`.
6. Move Prometheus to `/usr/local/prometheus` and remove the downloaded tarball.
7. Copy the `prometheus.yml` configuration file into the container.
8. Expose Prometheus on port `9090`.
9. Start Prometheus with the specified configuration file.

---

## Prometheus Configuration (`prometheus.yml`)

- **Global Settings**: 
  - Metrics are scraped every `15 seconds` as defined in the `scrape_interval`.
  
- **Scrape Configurations**:
  - Prometheus scrapes metrics from `localhost:9090`, which means it is scraping its own metrics.
  - To scrape additional services, you can add more `job_name` entries and specify their target URLs under `scrape_configs`.

---

## Build the Docker Image

To build the Docker image, run the following command:

```bash
sudo docker build -t prometheus:1.0.0 .
```

---

## Verify the Docker Image

After building the image, verify it using:

```bash
sudo docker images
```

---

## Run the Docker Container

To create and run a container from the image, use:

```bash
sudo docker run -p 9090:9090 prometheus:1.0.0
```

---

## Access Prometheus

Once the container is running, you can access the Prometheus UI in your browser at:

```
http://localhost:9090
```

You should see the Prometheus dashboard.

---

## Notes

- To monitor additional services, update the `prometheus.yml` file with new `job_name` and `targets`.
- Ensure that the services you want to monitor are accessible from the container.
# Automated Weather CLI Tool Deployment

## Project Overview
The **Automated Weather CLI Tool** is a command-line application that fetches real-time weather data for a given city using a public weather API (e.g., OpenWeatherMap). The tool:
- Accepts a city name as input.
- Retrieves weather details such as temperature, humidity, and weather conditions.
- Displays the fetched weather data in a user-friendly format.

The application is built in Python, packaged into a standalone binary using **PyInstaller**, and deployed to a **Red Hat Enterprise Linux (RHEL) VM** using **GitHub Actions**. The automation ensures that whenever changes are pushed to the repository, the tool is built, packaged, and securely transferred to a remote server.

## Features
- Fetches real-time weather information using APIs.
- Simple command-line interface for easy usage.
- Automated build and deployment using **GitHub Actions**.
- Secure passwordless authentication with **SSH Keys**.
- Version control tagging for tracking deployments.

## Prerequisites
Before setting up and running this project, ensure you have the following:
- **Python 3.9+** installed on your system.
- A **GitHub repository** to manage source code and workflow.
- **RHEL 9.5** (or an alternative Linux distribution) running on a VM.
- **Git and OpenSSH** installed on the VM.
- A public weather API key (e.g., OpenWeatherMap API).

## Installation and Setup
### 1. Clone the Repository
```sh
$ git clone https://github.com/your-username/weather-cli-tool.git
$ cd weather-cli-tool
```

### 2. Install Dependencies
```sh
$ sudo yum install python3-pip git -y
$ pip3 install requests
```

### 3. Configure API Key
Replace `your_openweathermap_api_key` in the source code with your actual API key.

### 4. Run the Weather CLI Tool
```sh
$ python3 weather.py --city "New York"
```

## Deployment Automation
### 1. Setting Up SSH Authentication
To enable passwordless authentication for secure deployments, follow these steps:
```sh
$ ssh-keygen -t rsa -b 4096
$ ssh-copy-id your-username@vm-ip-address
$ ssh your-username@vm-ip-address
```
Ensure that SSH authentication settings are configured correctly in `/etc/ssh/sshd_config`.

### 2. Configuring GitHub Actions
- The GitHub Actions workflow is located at `.github/workflows/build.yml`.
- It automates building and deploying the binary file to the RHEL VM.
- The workflow fetches secrets from **GitHub Secrets**, builds the application, and securely transfers it to the server.

### 3. Setting Up GitHub Secrets
Go to **Settings > Secrets and Variables > Actions** in your GitHub repository and add the following secrets:
- `SERVER_IP` – IP address of the RHEL VM.
- `SERVER_USER` – Username for SSH authentication.
- `SERVER_SSH_KEY` – Private SSH key for secure deployment.

### 4. Running GitHub Actions Workflow
After setting up the repository and secrets, push your changes to trigger the workflow:
```sh
$ git add .
$ git commit -m "Deploy Weather CLI Tool"
$ git push origin main
```
GitHub Actions will automatically build the project and deploy the binary to the remote server.

## Usage After Deployment
Once deployed, you can run the CLI tool directly on the server:
```sh
$ /home/Result/weather-<build_number> --city "Los Angeles"
```

## Contributing
Feel free to contribute by opening issues or submitting pull requests for enhancements and bug fixes.

## License
This project is licensed under the MIT License. See `LICENSE` for more details.

## Contact
For any queries or issues, reach out via GitHub Issues.

---
This README provides an overview of the project, installation steps, automation details, and deployment workflow. 🚀


# github-actions-docker

Self-hosted GitHub Actions Runner

## Set up
- Clone this repo
- Create a personal access token in GitHub
  - If a classic token
    - `admin:org`
  - If a fine grained token
    - `Read and Write access to organization self hosted runners`
- Create a `.env.sh` file in project
- Add these 2 values to .env.sh file:

```
PROJECT_GITHUB_ORGANIZATION=<YOUR_GITHUB_ORGANIZATATION>
PROJECT_GITHUB_ACCESS_TOKEN=<YOUR_GITHUB_ACCESS_TOKEN>
```

## Reference
https://testdriven.io/blog/github-actions-docker/

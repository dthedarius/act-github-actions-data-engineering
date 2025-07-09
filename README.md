## CI Testing for Data Engineers with `act`

This repository demonstrates how data engineers can **test GitHub Actions locally** using [`act`](https://github.com/nektos/act) before pushing to GitHub.

### ✅ What It Does
- Bumps the version number based on PR labels (`major`, `minor`, `patch`)
- Supports multiple environments (local, preprod, prod)
- Uses `.env` files and fake secrets for simulation

### 🛠️ Project Structure
```
.env/                # Environment-specific settings
.github/workflows/   # GitHub Actions workflows
VERSION              # Current version
Dockerfile.bump      # Custom Docker image for act
.test-secrets        # Local test secrets for act
Makefile             # Run your local CI test
```

### 🚀 How to Use
```bash
make test-ci-bump
```
This runs your GitHub Actions workflow locally using `act` and your test event JSON.

### 🔐 Secret & Env Management
- Secrets are defined in `.test-secrets`
- Env variables loaded from `.env/local.env`, `.env/preprod.env`, etc.

### 📦 Use Cases
- Safely test CI/CD without pushing to GitHub
- Iterate on workflows offline
- Validate automation logic

---

Happy testing 🚀

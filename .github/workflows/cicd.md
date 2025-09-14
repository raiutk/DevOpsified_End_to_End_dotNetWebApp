# 📘 CI/CD Pipeline Documentation
## 🚀 Workflow Overview

GitHub Actions workflow (.github/workflows/cicd.yaml) created for:
Building & testing .NET app
Running code quality checks
Building & pushing Docker image
Updating Helm chart with new image tag

# 🛠️ Issues Faced & Fixes
## 1. ❌ Git Push Error (main → main rejected)

Error:
Updates were rejected because the remote contains work that you do not have locally.

Fix:
Pulled latest changes with rebase:
git pull origin main --rebase
git push origin main
(Alternative: git push --force if sure about overwriting remote)

## 2. ❌ .NET SDK Version Mismatch

Error:
error NETSDK1045: The current .NET SDK does not support targeting .NET 9.0.

Fix:
Updated cicd.yaml to use supported SDK:

- name: Set up .NET
  uses: actions/setup-dotnet@v4
  with:
    dotnet-version: '8.0.x'

## 3. ❌ Docker Tag Format Error

Error:
invalid tag "/resume-webapp:17715409163": invalid reference format

Fix:
Corrected docker/build-push-action config:

- name: Build and push Docker image
  uses: docker/build-push-action@v4
  with:
    context: .
    file: ./Dockerfile
    push: true
    tags: ${{ secrets.DOCKERHUB_USERNAME }}/resume-webapp:${{ github.run_id }}

## 4. ❌ Container CrashLoopBackOff in Kubernetes

Error (from kubectl logs):
You must install or update .NET to run this application.
App: /app/ResumeWebApp.dll
Framework: 'Microsoft.NETCore.App', version '8.0.0'
The following frameworks were found: 9.0.9


Fix:
Mismatch between app runtime (8.0) and container base image (9.0)
Updated Dockerfile base image:
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
Rebuilt and redeployed → app started successfully

## ✅ Key Learnings
Always align .NET version in project, GitHub Actions, and Docker image.
Proper Docker tagging avoids runtime issues.
Use git pull --rebase to sync safely before pushing.
Logs (kubectl logs, GitHub Actions error output) are the fastest way to identify root cause.
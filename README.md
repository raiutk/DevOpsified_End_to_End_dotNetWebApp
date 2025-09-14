# ResumeWebApp — ASP.NET Core Razor Pages

This is a simple, single-file ASP.NET Core Razor Pages resume website pre-populated using your uploaded resume (Utkarsh_Rai_Resume.pdf). fileciteturn0file0

## What's included
- Minimal Razor Pages site (Program.cs + Pages/Index.cshtml)
- Static CSS and placeholder PNGs in `wwwroot`
- Instructions to run locally and in VS Code

## Prerequisites
- [.NET 7 SDK](https://dotnet.microsoft.com/download) or later installed.
- VS Code (recommended) with the **C#** extension.

## Run locally (terminal)
```bash
cd ResumeWebApp
dotnet restore
dotnet run
# open http://localhost:5000 in your browser
```

## VS Code setup (step-by-step)
1. Install [.NET 7 SDK](https://dotnet.microsoft.com/download).
2. Install VS Code and the **C#** extension by Microsoft.
3. Open VS Code → File → Open Folder → select the `ResumeWebApp` folder.
4. In the terminal inside VS Code run:
   - `dotnet restore`
   - `dotnet run`
5. Press `Ctrl+Click` on the URL shown (http://localhost:5000) or open the browser.

## Docker (optional)
A simple Dockerfile can be used — run `docker build -t resumewebapp .` and `docker run -p 8080:80 resumewebapp`.


# Project 3: OIDC Passwordless Authentication & Federated Identity

## 📌 Overview
This project replaces static client credentials (passwords) with OpenID Connect (OIDC) federated credentials between GitHub Actions and Microsoft Entra ID (Azure AD).

## 🛠️ Key Capabilities
* **Zero-Trust Security:** Eliminates long-lived `AZURE_CLIENT_SECRET` credentials from repository secrets.
* **Short-Lived Tokens:** Requests ephemeral JSON Web Tokens (JWT) using GitHub's OIDC issuer (`id-token: write`).
* **Azure Federated Credentials:** Authenticates GitHub runner sessions using `azure/login@v2` with scoped role permissions.

## 🛡️ Security Profile
* **Permissions Scope:** Strictly limited to `id-token: write` and `contents: read`.
* **Provider Flag:** Configured `ARM_USE_OIDC: true` for the HashiCorp Azure Provider.

## 🔑 Key Takeaways
* Implements enterprise-grade cloud authentication best practices recommended by security frameworks.
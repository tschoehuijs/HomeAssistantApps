[![Home Assistant](https://img.shields.io/badge/Home_Assistant-2026.6-blue.svg?logo=home-assistant)](https://www.home-assistant.io/)

# My Home Assistant Add-ons

Welcome to my personal Home Assistant add-on repository!

### ⚠️ Warning: Use at Your Own Risk
These add-ons are strictly for personal use and are provided "as-is" without any warranties. I am an amateur and made most of this using AI - my configurations or code may contain errors. Installing custom add-ons can potentially crash your system, cause data loss, or expose security vulnerabilities. **You are using this repository entirely at your own risk.**

Because this is a personal project, please be aware that **issues or pull requests may go completely unresolved.** If something breaks, I might fix it for my own setup, but I cannot guarantee support for other users.

### The Add-ons
All credit for the actual software goes to their respective creators. You can find the original projects here:

* [**Wizarr**](https://github.com/wizarrrrr/wizarr) - Media Management Software (MIT License)
* [**Tracearr**](https://github.com/connorgallopo/Tracearr) - Monitoring platform for Plex, Jellyfin, and Emby (AGPL-3.0 License)
* [**Chaptarr**](https://github.com/Chaptarr/chaptarr) - Audiobook and eBook collection manager (GPL-3.0 License)
* [**Vinted MCP Server**](https://github.com/andrijdavid/vinted-mcp) - MCP tools for Vinted marketplace search, listings, sellers, and price analysis.

Each app has its own `DOCS.md` with configuration, usage, updates, and troubleshooting guidance. In Home Assistant, open the app's **Documentation** tab.

### Licenses
This repository contains wrappers for open-source projects. Please consult the upstream license and the `LICENSE` file, where provided, in each add-on folder:

* **Wizarr Add-on:** MIT License
* **Tracearr Add-on:** AGPL-3.0 License
* **Chaptarr Add-on:** GPL-3.0 License
* **Vinted MCP Server:** See [upstream license](https://github.com/andrijdavid/vinted-mcp/blob/main/LICENSE.md).

### Installation

[![Add repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Ftschoehuijs%2FHomeAssistantApps)

To add this repository manually and install the apps in Home Assistant:

1. Open Home Assistant and navigate to **Settings** > **Add-ons**.
2. Click the **ADD-ON STORE** button.
3. Open the three-dot menu and select **Repositories**.
4. Add this repository: `https://github.com/tschoehuijs/HomeAssistantApps`.
5. Close the dialog and use **Reload** from the store menu.
6. Find this repository at the bottom of the store.
7. Select the app you want (Wizarr, Tracearr, Chaptarr, or Vinted MCP Server) and click **Install**.
8. Review the **Configuration** and **Network** settings before starting.


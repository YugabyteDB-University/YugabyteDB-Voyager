<div style="width:100%; background-color: #121017"><a target="_blank" href="http://university.yugabyte.com?utm_source=gitpod&utm_medium=notebook"><img src="assets/YBU_Logo.png" /></a></div><br>

> **Migrate and Modernize with YugabyteDB Voyager**
>
> Enroll for free at [Yugabyte University](https://university.yugabyte.com/courses/migrate-and-modernize-with-yugabytedb-voyager).
>


---
<div style="width:100%; background-color: #000041"><img src="assets/Gitpod_YugabyteDB_Voyager.gif" /></div>

To start the Gitpod environment, which is also free to use, select the "Open in Gitpod" button below👇. 


[![](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/YugabyteDB-University/YugabyteDB-Voyager)

All you need is a Github account to run Gitpod for free. Gitpod is an on-demand developer environment for a GitHub, Git, or BitBucket workspace. It's super easy to use, offers 50 hours of free use per month, and only requires a chromium-based browser.

Using Gitpod, you can run the Jupyter notebook files in an on-demand Visual Studio Code, browser-based environment. 😎

This repository contains the notebook files for [Migrate and modernize with YugabyteDB Voyager](https://university.yugabyte.com/courses/migrate-and-modernize-with-yugabytedb-voyager?utm_source=gitpod&utm_medium=notebook), a free course that is available at [Yugabyte University](https://university.yugabyte.com/courses/migrate-and-modernize-with-yugabytedb-voyager?utm_source=gitpod&utm_medium=notebook).


## New to Github and Gitpod? 
Here's how to start...
- Create a Github account. It's free at [https://github.com/join](https://github.com/join).
- Next, in a Chromium browser, open the Gitpod link for the GitHub repository. The link is a prefix  `gitpod.io/#` - and the entire URL for the repository. For example, `gitpod.io/#https://github.com/gitpod-io/website](https://github.com/YugabyteDB-University/YugabyteDB-Voyager`. 
- Then, authorize Gitpod to use your GitHub account. In the dialog, select **Authorize gitpod.io**.
- Select your default editor, VS Code Browser. Select **Continue**.
- Depending on the image configuration, it may take a few minutes for the image to build and deploy to the Gitpod workspace.
- Review the terminal output for additional instructions.

### FAQS

**Will this repository or similar be made available at github.com/yugabyte?**
- Currently, no. Gitpod is not available for the Yugabyte account.

**What is Gitpod?**
- Gitpod is a free developer service that makes it easy for maintainers to automate any non-executable setup instructions as code. Gitpod is part of Github.com. Gitpod launches pre-configured containers for a given project. 
  
**How much does Gitpod cost?**
- Gitpod is free for the first 50 hours of usage for a given month. To learn more, see [https://www.gitpod.io/pricing](https://www.gitpod.io/pricing).

**How can I sign up for Gitpod?**
- Sign up for a Github.com account.
- To install the Gitpod browser extension, check out [https://www.gitpod.io/docs/quickstart#installing-the-gitpod-browser-extension](https://www.gitpod.io/docs/quickstart#installing-the-gitpod-browser-extension).

**How do I start Gitpod?**
- Simply select this link: [https://gitpod.io/#https://github.com/YugabyteDB-University/YugabyteDB-Voyager](https://gitpod.io/#https://github.com/YugabyteDB-University/YugabyteDB-Voyager)


**Why does it take 5 minutes to start up?**
- Gitpod builds a docker image for VS Code, related extensions, and YugabyteDB. This takes a few minutes. However, after your image is created, subsequent launches will be much faster.

**OK, it started, BUT the ybu-lab terminal shows errors. What can I do???**
- There should be some helpful error messages, but in spite of that, you can run two scripts:
  - `start_all.sh` starts yugabyted and accepts 1 argument with zero or 1 value: `zone`, `region`, or `cloud`
  - `stop_and_destroy_all.sh` kills all the nodes.
- Here's how to force the fix and get things back on track in the `ybu-lab` terminal:
  - 1) `cd $GITPOD_REPO_ROOT`
  - 2) `.\stop_and_destroy_all.sh`
  - 3) `.\start_all.sh zone`

**I'm still running into issues. Where can I find help and support?**
- You can ask questions our community Slack in the #training channel at [YugabyteDB Community Slack](https://join.slack.com/t/yugabyte-db/shared_invite/zt-xbd652e9-3tN0N7UG0eLpsace4t1d2A/?utm_source=gitpod&utm_medium=notebook).


---
## Release notes
- 20240131
  - Update to YugabyteDB 2.20.1
- 20231226
  - Update start scripts and variables
- 20231130
  - Update for Voyager 1.6
  - Update notebooks for end migration and new boolean flags

- 20231122
  - Update notebooks for university.yugabyte.com course
  - Add post-import-data step
  - Update README.md
  

- 20230922
  - Update to Voyager 1.5 and YugabyteDB 2.19.2.0
  - Update notebooks for new voyager log paths
  - Address issues with `actor_info` view
  

- 20230912
  - Initial release for Distributed SQL session
  - Voyager 1.4 and YugabyteDB 2.19.0.0

# KYC AML (USA Sanctions-Based)

## NO WARRANTY, USE AT YOUR OWN RISK

[![pipeline status gitlab](https://gitlab.com/defcronyke/kycaml-app/badges/master/pipeline.svg)](https://gitlab.com/defcronyke/kycaml-app/-/pipelines) [![github-pipeline](https://github.com/defcronyke/kycaml-app/workflows/github-pipeline/badge.svg)](https://github.com/defcronyke/kycaml-app/actions) [![sponsor the project](https://img.shields.io/static/v1?label=Sponsor&message=%E2%9D%A4&logo=GitHub&link=https://github.com/sponsors/defcronyke)](https://github.com/sponsors/defcronyke)

---

## License and Usage Terms

Copyright (c) 2021 `Jeremy Carter <jeremy@jeremycarter.ca>`

GPL v2 (or newer) License: [GitLab Mirror](https://gitlab.com/defcronyke/kycaml-app/-/raw/master/LICENSE) | [GitHub Mirror](https://raw.githubusercontent.com/defcronyke/kycaml-app/master/LICENSE)

`*** NO WARRANTY, USE AT YOUR OWN RISK! ***`

---

### Website

- Online version (mirror 1): [https://kycaml.saladfinder.com](https://kycaml.saladfinder.com)
- Online version (mirror 2): [https://kycaml.cryptospread.com](https://kycaml.cryptospread.com)
- GitLab mirror (demo): [https://defcronyke.gitlab.io/kycaml-app](https://defcronyke.gitlab.io/kycaml-app)
- GitHub mirror (demo): [https://defcronyke.github.io/kycaml-app](https://defcronyke.github.io/kycaml-app)
- Local server: [http://127.0.0.1:3000](http://127.0.0.1:3000)
- Local server (Docker): [http://127.0.0.1:8080](http://127.0.0.1:8080)

## Source Code

### Golang App

- GitLab: [https://gitlab.com/defcronyke/kycaml-app](https://gitlab.com/defcronyke/kycaml-app)
- GitHub [https://github.com/defcronyke/kycaml-app](https://github.com/defcronyke/kycaml-app)

### Golang Module

- GitLab: [https://gitlab.com/defcronyke/kycaml](https://gitlab.com/defcronyke/kycaml)
- GitHub [https://github.com/defcronyke/kycaml](https://github.com/defcronyke/kycaml)

---

## Automated builds from the master branch

### Release Binary

- [Linux x86_64 (GitLab mirror)](https://gitlab.com/defcronyke/kycaml-app/-/jobs/artifacts/master/download?job=release-linux-x86_64)
- [Linux x86_64 (GitHub mirror)](https://tinyurl.com/github-artifact?repo=defcronyke/kycaml-app&file=kycaml-app-release-linux-x86_64)

### Debug Binary

- [Linux x86_64 Debug (GitLab mirror)](https://gitlab.com/defcronyke/kycaml-app/-/jobs/artifacts/master/download?job=debug-linux-x86_64)
- [Linux x86_64 Debug (GitHub mirror)](https://tinyurl.com/github-artifact?repo=defcronyke/kycaml-app&file=kycaml-app-debug-linux-x86_64)

NOTE: After downloading and extracting from the GitHub mirror, you need to run the following commands because GitHub Actions isn't preserving the correct permissions for the files:

```shell
cd kycaml-app && \
chmod 755 kycaml-app && \
chmod 755 *.sh && \
chmod -R 755 cmd
```

## How to compile from source

```shell
git clone https://gitlab.com/defcronyke/kycaml.git; \
git clone https://gitlab.com/defcronyke/kycaml-app.git; \
cd kycaml-app; \
./build.sh
```

---

## Usage

### Update the sanctions lists

```shell
./update-lists.sh
```

### Run the server

```shell
# Binary version:
./kycaml-app

# Source version:
./run.sh

# Docker version (docker-compose with MongoDB):
./up.sh

# Stop Docker version (docker-compose with MongoDB):
./down.sh

# Rebuild Docker version and run:
./up.sh -b

# Rebuild Docker version:
./build-container.sh
```

### API

- GET /names
  - Online (mirror 1): [https://kycaml.saladfinder.com/names](https://kycaml.saladfinder.com/names)
  - Online (mirror 2): [https://kycaml.cryptospread.com/names](https://kycaml.cryptospread.com/names)
  - Local: [http://127.0.0.1:3000/names](http://127.0.0.1:3000/names)
  - Docker: [http://127.0.0.1:8080/names](http://127.0.0.1:8080/names)

### Specially Designated Nationals And Blocked Persons (USA)

- JSON (unofficial format):
  - [https://kycaml.saladfinder.com/sdn](https://kycaml.saladfinder.com/sdn)
- XML (local version only):
  - [http://127.0.0.1:3000/sdn.xml](http://127.0.0.1:3000/sdn.xml) (local)
  - [http://127.0.0.1:8080/sdn.xml](http://127.0.0.1:8080/sdn.xml) (Docker)
- From:
  - [https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-data-formats-data-schemas](https://home.treasury.gov/policy-issues/financial-sanctions/specially-designated-nationals-list-data-formats-data-schemas)  
    `-> SDN_ADVANCED.XML`

### Consolidated Advanced Sanctions (USA)

- JSON (unofficial format):
  - [https://kycaml.saladfinder.com/cons](https://kycaml.saladfinder.com/cons)
- XML:
  - [https://kycaml.saladfinder.com/cons.xml](https://kycaml.saladfinder.com/cons.xml)
  - [http://127.0.0.1:3000/cons.xml](http://127.0.0.1:3000/cons.xml) (local)
  - [http://127.0.0.1:8080/cons.xml](http://127.0.0.1:8080/cons.xml) (Docker)
- From:
  - [https://home.treasury.gov/policy-issues/financial-sanctions/consolidated-sanctions-list-non-sdn-lists](https://home.treasury.gov/policy-issues/financial-sanctions/consolidated-sanctions-list-non-sdn-lists)  
    `-> CONS_ADVANCED.XML`

# Container image that runs your code
FROM node:bullseye-slim

RUN npm i -g mermaid-filter --registry=https://registry.npm.taobao.org
RUN apt update && apt install -y --no-install-recommends  --no-install-suggests ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils

COPY pandoc1 /usr/bin/pandoc1
COPY custom-reference-whucs.docx /custom-reference-whucs.docx
COPY mermaid-filter /usr/bin/mermaid-filter
# Copies your code file from your action repository to the filesystem path `/` of the container
COPY md2docx.sh /md2docx.sh
COPY entrypoint.sh /entrypoint.sh
COPY .puppeteer.json /.puppeteer.json

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]

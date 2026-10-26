
FROM python:3.12-slim


WORKDIR /app

COPY lib/ ./lib/

COPY archViewer.html .

COPY archViewer.js .

COPY viewerProxy.py .


RUN groupadd --system app && useradd --system --gid app --no-create-home app

USER app


ENV LISTENING_PORT=8080

ENV HOST_NAME=http://archiver-appliance:17668/retrieval/


CMD ["python3", "viewerProxy.py", "$LISTENING_PORT", "$HOST_NAME"]

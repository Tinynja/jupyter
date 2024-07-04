FROM python:3.11-slim

RUN pip install --upgrade pip
RUN pip install jupyterlab
RUN pip install --index-url https://download.pytorch.org/whl/cu121 torch torchvision torchaudio

RUN useradd -m user

RUN mkdir /app
COPY src/* /app/
RUN chmod +x /app/*.sh

WORKDIR /data
VOLUME /data
EXPOSE 8888/tcp

ENTRYPOINT ["/app/init.sh"]
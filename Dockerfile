FROM python:3.9-bullseye

RUN pip install --upgrade pip
RUN pip install notebook
RUN pip install --index-url https://download.pytorch.org/whl/cu118 torch torchvision torchaudio

RUN useradd -m user

COPY src/*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/*

WORKDIR /data
VOLUME /data
EXPOSE 8888/tcp

ENTRYPOINT ["/usr/local/bin/init.sh"]
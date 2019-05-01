FROM python AS dev
WORKDIR /app
COPY standalone.py standalone.pyx
RUN apt update && apt install -y python-dev python3-dev
RUN pip install cython
RUN cython -3 standalone.pyx --embed
RUN gcc -Os -I /usr/include/python3.5m -o standalone standalone.c -lpython3.5m -lpthread -lm -lutil -ldl
FROM debian:9-slim
RUN apt update && apt install -y python-dev python3-dev
COPY --from=dev /app/standalone /standalone
CMD ["/standalone"]

FROM python:3.9

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
ENV PIP_INDEX_URL=https://mirrors.aliyun.com/pypi/simple/
ENV PIP_TRUSTED_HOST=mirrors.aliyun.com
ENV PIP_DEFAULT_TIMEOUT=300
ENV PIP_RETRIES=5
RUN pip install Flask==3.1.3 uWSGI==2.0.31 requests==2.32.5 redis==7.0.1
WORKDIR /app
COPY app /app
COPY cmd.sh /
RUN chmod +x /cmd.sh

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
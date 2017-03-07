FROM ubuntu:16.04

# ansible runs only on python2. so we install python2 as system python
# our testcases runs on python3. so we make a python3 virtualenv at /venv/testenv/ and run tests with it.

ENV LANG C.UTF-8
RUN apt-get update && apt-get install -y python python-dev python3.5 python3.5-dev python-pip virtualenv libssl-dev libpq-dev git build-essential
RUN pip install setuptools pip --upgrade --force-reinstall
RUN pip install ansible==2.1.2.0
RUN pip install nodeenv==1.1.0
RUN virtualenv /venv/testenv/ -p `which python3.5`
RUN nodeenv /nenv/testenv/

ENV LANG C.UTF-8
ENV NODE_VIRTUAL_ENV /nenv/testenv/
ENV NODE_PATH "$NODE_VIRTUAL_ENV/lib/node_modules"
ENV NPM_CONFIG_PREFIX $NODE_VIRTUAL_ENV
ENV npm_config_prefix $NODE_VIRTUAL_ENV
ENV PATH "$NODE_VIRTUAL_ENV/lib/node_modules/.bin:$NODE_VIRTUAL_ENV/bin:$PATH"

ADD requirements.txt /run/requirements.txt
RUN /venv/testenv/bin/pip install -r /run/requirements.txt

FROM ubuntu:16.04

# ansible runs only on python2. so we install python2 as system python
# our testcases runs on python3. so we make a python3 virtualenv at /venv/testenv/ and run tests with it.

RUN apt-get update && apt-get install -y python python-dev python3.5 python3.5-dev python-pip virtualenv libssl-dev libpq-dev git build-essential
RUN pip install setuptools pip --upgrade --force-reinstall
RUN pip install ansible==2.1.2.0
RUN virtualenv /venv/testenv/ -p `which python3.5`
ADD requirements.txt /run/requirements.txt
RUN /venv/testenv/bin/pip install -r /run/requirements.txt

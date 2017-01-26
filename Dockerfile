FROM python:2.7

RUN pip install setuptools pip --upgrade --force-reinstall
RUN pip install ansible==2.1.2.0
RUN pip install nodeenv==1.1.0
RUN apt-get update && apt-get install -y python3 python3-dev 
RUN virtualenv /venv/testenv/ -p `which python3`
RUN /venv/testenv/bin/pip install pytest pytest-django pytest-pep8 mock mock-django numpy pandas psycopg2 'django<1.10'
RUN nodeenv /nenv/testenv/
ADD package.json package.json
RUN source /nenv/testenv/bin/activate && npm install
RUN . /nenv/testenv/bin/activate && npm install

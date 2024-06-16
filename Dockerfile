FROM registry.k.avito.ru/avito/service-python/cuda/runtime/devel:3.8.12-cuda11.7.1-cudnn8.5.0.96

COPY ./requirements.txt ./test-requirements.txt ./dev-requirements.txt $PROJECT_ROOT/
RUN pip3 install pip -U
RUN pip3 install --no-cache-dir -r requirements.txt -r test-requirements.txt -r dev-requirements.txt

ARG context="DEV"

COPY . $PROJECT_ROOT
COPY jupyter_notebook_config.py /root/.jupyter/

RUN avio-cli generate_swagger
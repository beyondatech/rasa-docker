FROM qts8n/cuda-python:runtime

ARG MODEL
RUN pip3 install -U pip setuptools wheel rasa spacy[cuda102] \
    && python -m spacy download $MODEL

WORKDIR /app
ENV HOME=/app

# set entrypoint for interactive shells
ENTRYPOINT ["rasa"]


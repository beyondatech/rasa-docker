FROM python:3.7-slim

# install dependencies of interest
RUN python -m pip install rasa[spacy] 

ARG MODEL
RUN python -m spacy download $MODEL

# set workdir and copy data files from disk
# note the latter command uses .dockerignore
WORKDIR /app
ENV HOME=/app

# set the user to run, don't run as root
USER 1001

# set entrypoint for interactive shells
ENTRYPOINT ["rasa"]


#!/bin/bash

# Construyendo la imagen
docker build -t 2p_2024_chardia .

# Inicio en mi cuenta
docker login

# Subo la imagen
docker tag 2p_2024_chardia eliascharadia/2p_2024_chardia:latest

docker push eliascharadia/2p_2024_chardia:latest

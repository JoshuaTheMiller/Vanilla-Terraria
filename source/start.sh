#!/bin/bash

mono --server --gc=sgen -O=all TerrariaServer.exe -configpath /world -worldpath /world -logpath /world "$@" 
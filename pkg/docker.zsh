#!/usr/bin/env ksh
# -*- coding: utf-8 -*-

function awscli {
    docker run --rm -it \
           -v "$(pwd):/home/nikovirtala" \
           -v "${HOME}/.aws:/home/nikovirtala/.aws" \
           -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
           -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
           -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
           nikovirtala/awscli:latest "$@"
}

function aws-shell {
    docker run --rm -it \
           -v "$(pwd):/home/nikovirtala" \
           -v "${HOME}/.aws:/home/nikovirtala/.aws" \
           -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
           -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
           -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" \
           nikovirtala/aws-shell:latest "$@"
}

# show nyancat in terminal
function nyancat {
    docker run -it --rm supertest2014/nyan;
}

function ytd-mp3 {
    docker run --rm -v "${PWD}":/data hadenlabs/youtube-dl --extract-audio --audio-format mp3 "$@"
}

function ytdl {
    docker run --rm -v "${PWD}":/data hadenlabs/youtube-dl "$@"
}

function youtube-dl {
    docker run --rm -v "${PWD}":/data hadenlabs/youtube-dl "$@"
}

function pandoc {
    docker run --rm -v "${PWD}":/data hadenlabs/pandoc "$@"
}

function komiser {
    docker run --rm -d -p 3000:3000 \
           -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
           -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
           -e AWS_DEFAULT_REGION="${AWS_DEFAULT_REGION}" --name komiser mlabouardy/komiser:2.4.0
}

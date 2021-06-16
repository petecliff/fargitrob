FROM seaninety/gitrob:latest

RUN apk add --no-cache python3 py3-pip
RUN pip3 install --upgrade pip && pip3 install awscli && rm -rf /var/cache/apk/*

COPY ./entry_point.sh ./

ENTRYPOINT [ "/bin/sh" ]
CMD [ "entry_point.sh" ]
FROM debian:bullseye

RUN apt update -y && apt-get upgrade -y && apt-get -y install nginx openssl vim

# RUN apt install php

COPY ./tools/script.sh /

CMD [ "/script.sh" ]

# ENTRYPOINT nginx -g "daemon off;"

# CMD ["nginx", "-g", "daemon off;"]

# EXPOSE 443

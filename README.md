yarn build
docker build . -t penguenumut/udocker101:v1
docker run -p 49160:8080 -d penguenumut/udocker101:v1

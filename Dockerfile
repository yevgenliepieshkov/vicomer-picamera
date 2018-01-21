FROM resin/raspberrypi3-python:latest

ENV INITSYSTEM on
ENV READTHEDOCS True

RUN apt-get update && \
	apt-get install -y cmake python-numpy python-scipy

RUN git clone https://github.com/itseez/opencv.git /usr/local/src/opencv

RUN cd /usr/local/src/opencv && \
mkdir release && cd release && \
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..

RUN cd /usr/local/src/opencv/release && \
make && make install

RUN rm -rf /usr/local/src/opencv \
	&& apt-get purge -y cmake \
	&& apt-get autoremove -y --purge

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

ENV LD_LIBRARY_PATH /usr/local/lib

ADD test.py /test.py


CMD ["python","test.py"]

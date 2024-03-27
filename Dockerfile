FROM ubuntu:22.04
WORKDIR /workdir
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y unzip \
  && apt-get install libgomp1 \
  && rm -rf /var/lib/apt/lists/* \
  && wget -qO- https://packages.lunarg.com/lunarg-signing-key-pub.asc | tee /etc/apt/trusted.gpg.d/lunarg.asc \
  && wget -qO /etc/apt/sources.list.d/lunarg-vulkan-1.3.280-jammy.list https://packages.lunarg.com/vulkan/1.3.280/lunarg-vulkan-1.3.280-jammy.list \
  && apt-get update \ 
  && apt-get install -y vulkan-sdk
RUN wget https://github.com/xinntao/Real-ESRGAN/releases/download/v0.2.5.0/realesrgan-ncnn-vulkan-20220424-ubuntu.zip
RUN unzip realesrgan-ncnn-vulkan-20220424-ubuntu.zip
RUN rm *.zip *.jpg *.mp4 *.md
RUN chmod +x realesrgan-ncnn-vulkan
RUN apt-get remove -y wget \ 
  && apt-get remove -y unzip
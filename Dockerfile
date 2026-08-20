FROM node:20-slim

# Media aur build dependencies
RUN apt-get update && apt-get install -y \
    ffmpeg \
    imagemagick \
    webp \
    git \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY package*.json ./

# Low RAM optimization ke sath install
RUN npm install --production --legacy-peer-deps

COPY . .

EXPOSE 5000

CMD ["npm", "start"]

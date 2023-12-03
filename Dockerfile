FROM node:21.3.0
WORKDIR /app
ENV PORT 3000
EXPOSE ${PORT}
COPY . /app
CMD ["npm", "run", "dev", "--", "--port", "3000", "&"]
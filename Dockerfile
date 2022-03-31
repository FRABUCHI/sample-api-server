FROM public.ecr.aws/docker/library/node:lts-gallium AS builder
WORKDIR /app
## 프로젝트의 모든 파일을 WORKDIR(/app)로 복사한다
COPY . .
## Nest.js project를 build 한다
RUN yarn install
RUN yarn run build

FROM 601340144943.dkr.ecr.ap-northeast-2.amazonaws.com/node
WORKDIR /app
## Step 1의 builder에서 build된 프로젝트를 가져온다
COPY --from=builder /app ./
## application 실행
CMD ["yarn", "run", "start:dev"]
EXPOSE 3000
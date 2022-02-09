#! /bin/sh
IMAGETAG=starsellersworld/reactphpzeromq:7.4-cli-alpine3.15
ARCHS="amd64 arm32v7"

TAGMANIFEST=starsellersworld/reactphpzeromq:7.4-cli-alpine3.15

INMANIFEST=

for arch in $ARCHS; do
    echo docker build -t ${IMAGETAG}-${arch} --build-arg ARCH=${arch}/ .
    docker build -t ${IMAGETAG}-${arch} --build-arg ARCH=${arch}/ .
    echo docker push ${IMAGETAG}-${arch}
    docker push ${IMAGETAG}-${arch}
    INMANIFEST="${INMANIFEST} ${IMAGETAG}-${arch}"
done

docker manifest create $TAGMANIFEST $INMANIFEST
docker manifest push --purge $TAGMANIFEST

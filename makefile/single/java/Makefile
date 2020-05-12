include ${SCRIPTS_DIR}/makefile/single/Makefile
VERSION=0.0.1-SNAPSHOT
JAVA_VERSION=14

SOURCE_DIR=$(shell pwd | sed 's/\/mnt\/\(.\)/\1:/g')

# https://hub.docker.com/_/openjdk/
DOCKER_RUN_GRADLE_COMMAND=docker run --rm -v ${SOURCE_DIR}:/usr/src/${PROJECT_NAME} -v ${SOURCE_DIR}/${SCRIPTS_DIR}:/usr/src/scripts -w /usr/src/${PROJECT_NAME} -e GBESANCON_GITHUB_AZURE_DEVOPS_PACKAGE_TOKEN="${GBESANCON_GITHUB_AZURE_DEVOPS_PACKAGE_TOKEN}" openjdk:${JAVA_VERSION} ./gradlew -Pversion=${VERSION}

setup:
	bash ${SCRIPTS_DIR}/makefile/single/java/install_jdk.sh oracle ${JAVA_VERSION}

clean:
	${DOCKER_RUN_GRADLE_COMMAND} clean

build-dev:
	${DOCKER_RUN_GRADLE_COMMAND} build report -PuseMavenLocal

build:
	${DOCKER_RUN_GRADLE_COMMAND} build report

publish-dev:
	${DOCKER_RUN_GRADLE_COMMAND} distribute -PuseMavenLocal

publish:
	${DOCKER_RUN_GRADLE_COMMAND} distribute

ci-build-dev:
	${DOCKER_RUN_GRADLE_COMMAND} clean build report distribute -PuseMavenLocal

ci-build:
	${DOCKER_RUN_GRADLE_COMMAND} clean build report distribute

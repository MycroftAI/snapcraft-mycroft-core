pipeline {
    parameters {
        string(name: 'BRANCH', defaultValue: 'dev', description: 'Branch of mycroft-core to build')
    }
    agent any
    environment {
        // Some branches have a "/" in their name (e.g. feature/new-and-cool)
        // Some commands, such as those tha deal with directories, don't
        // play nice with this naming convention.  Define an alias for the
        // branch name that can be used in these scenarios.
        BRANCH_ALIAS = sh(
            script: 'echo $BRANCH_NAME | sed -e "s#/#-#g"',
            returnStdout: true
        ).trim()
        //spawns GITHUB_USR and GITHUB_PSW environment variables
        GITHUB=credentials('38b2e4a6-167a-40b2-be6f-d69be42c8190')
    }
    stages {
        stage('Setup') {
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                sh 'git clone https://$GITHUB_PSW@github.com/MycroftAI/devops.git'
            }
        }
        stage('Build and upload snap package') {
            environment {
                SNAP_LOGIN=credentials('snapcraft_login')
            }
            when {
                anyOf {
                    branch 'dev'
                    branch 'master'
                }
            }
            steps {
                echo 'Building snap package...'
                sh 'docker build -f ./devops/snapcraft/Dockerfile -t \
                    snapcraft-build .'
                echo "Getting ${params.BRANCH}"
                sh "git clone https://github.com/MycroftAI/mycroft-core.git --branch ${params.BRANCH}"
                echo 'Building snap package...'
                sh 'docker run  -v "${PWD}":/build -w /build \
                        snapcraft-build:latest snapcraft'
                echo 'Pushing package to snap store'
                sh('''
                    mkdir -p .snapcraft
                    cat ${SNAP_LOGIN} | base64 --decode --ignore-garbage \
                        > .snapcraft/snapcraft.cfg
                    docker run  -v "${PWD}":/build -w /build \
                        snapcraft-build:latest snapcraft \
                        push --release edge *.snap
                    rm -rf .snapcraft
                   ''')
            }
        }
    }
    post {
        cleanup {
            sh(
                label: 'Snapcraft Cleanup',
                script: '''
                    docker run  -v "${PWD}":/build -w /build \
                        snapcraft-build:latest snapcraft clean
                    '''
            )
            sh(
                label: 'Job workspace cleanup',
                script: '''
                    rm -rf mycroft-core
                    rm -f *.snap
                '''
            )
            sh(
                label: 'Docker Container and Image Cleanup',
                script: '''
                    docker container prune --force;
                    docker image prune --force;
                '''
            )
            sh(
                label: 'Devops scripts cleanup',
                script: '''
                    rm -rf devops
                '''
            )
        }
    }
}
